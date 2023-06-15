#!/bin/bash
#SBATCH -A staff
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 2:00:00
#SBATCH -J iGenomes_STAR

# based on Wes's original script for building STAR genome indices, modified to
# build in the new version2.7.x/ subdirectory rather than $SNIC_TMP and to
# include the --genomeSAindexNbases calculation

module load tinyutils/1.4
module load bioinfo-tools
module load star/2.7.9a
module load exonerate/2.4.0

IGEN=/sw/data/iGenomes
BUILD=$1
VICT=$IGEN/$BUILD

# most assemblies use genome.fa for the whole genome assembly file, but there are two exceptions
if [[ "$BUILD" == "Homo_sapiens/GATK/GRCh37" ]] ; then
    GENOMEFASTA=human_g1k_v37_decoy.fasta
elif [[ "$BUILD" == "Homo_sapiens/GATK/GRCh38" ]] ; then
    GENOMEFASTA=Homo_sapiens_assembly38.fasta
else
    GENOMEFASTA=genome.fa
fi

echo -e "\n$BUILD: do we need a STAR 2.7.x index?"

# is there Sequence/WholeGenomeFasta?  is there a whole genome file?
if [[ ! -d $VICT/Sequence || ! -d $VICT/Sequence/WholeGenomeFasta ]] ; then
    echo -e "$BUILD: no Sequence/WholeGenomeFasta/ directory, exiting\n"
    exit 0
fi
if [[ ! -e $VICT/Sequence/WholeGenomeFasta/$GENOMEFASTA ]] ; then
    # The ./build script takes care of a couple releases that don't have genome.* genomes
    echo -e "$BUILD: Sequence/WholeGenomeFasta/$GENOMEFASTA to work with, exiting\n"
    exit 0
fi
echo -e "$BUILD: Found $GENOMEFASTA"

DEST=$VICT/Sequence/STARIndex/version2.7.x
echo -e "$BUILD: working directory $DEST"
mkdir -p $DEST || { echo "*** could not create working directory"; exit 1; }
cd $DEST

# work from a symlink
[[ ! -L $GENOMEFASTA ]] && rm -f $GENOMEFASTA
ln -sf $VICT/Sequence/WholeGenomeFasta/$GENOMEFASTA .

GTF=''
if [[ -e $VICT/Annotation/Genes/genes.gtf ]]
then
    echo -e "$BUILD: Found genes.gtf"
    # work from a symlink
    [[ ! -L genes.gtf ]] && rm -f genes.gtf
    ln -sf $VICT/Annotation/Genes/genes.gtf .
    GTF='--sjdbGTFfile genes.gtf --sjdbOverhang 100'
fi

#
#If we have already built a genome here, return
#
echo -e "$BUILD: Do we need to build an index?"
if [[ -f Log.out && -f SAindex ]] && tail -n 2 Log.out | head -n 1 | grep -F 'finished successfully' ; then
    echo -e "$BUILD: STAR 2.7.x index already build successfully, exiting\n"
    exit 0
fi

echo -e "$BUILD: building STAR 2.7.x index ..."

# Calculate value to use for --genomeSAindexNbases option. Default is 14, smaller genomes need smaller value
#
# get genome size, using fastalength from exonerate and sum from tinyutils
GENOMESIZE=$(fastalength $GENOMEFASTA | cut -f1 -d' ' | sum)
# calculate value for --genomeSAindexNbases option based on STAR manual section 2.2.5 recommendation
# https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf
INDEXNBASES=$(perl -MPOSIX -MList::Util=min -E "say min(14, floor((log($GENOMESIZE) / log(2)) / 2 - 1))")
INDEXNBASES="--genomeSAindexNbases $INDEXNBASES"


CMD="STAR --runMode genomeGenerate --runThreadN 10 --genomeDir ./ --genomeFastaFiles $GENOMEFASTA $INDEXNBASES $GTF"
echo "$CMD"
eval $CMD
echo -e "$BUILD: index completed"
echo

