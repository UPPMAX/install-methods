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
VICT=$IGEN/$1
DEST=$VICT/Sequence/STARIndex/version2.7.x
echo $VICT
mkdir -p $DEST || exit 1
cd $DEST
echo -e "\nworking directory  -- $DEST\n"

cp -av $VICT/Sequence/WholeGenomeFasta/genome.fa .

GTF=''
if [ -e $VICT/Annotation/Genes/genes.gtf ]
then
    cp -av $VICT/Annotation/Genes/genes.gtf .
    GTF='--sjdbGTFfile genes.gtf --sjdbOverhang 100'
fi

# Calculate value to use for --genomeSAindexNbases option. Default is 14, smaller genomes need smaller value
#
# get genome size, using fastalength from exonerate and sum from tinyutils
GENOMESIZE=$(fastalength genome.fa | cut -f1 -d' ' | sum)
# calculate value for --genomeSAindexNbases option based on STAR manual section 2.2.5 recommendation
# https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf
INDEXNBASES=$(perl -MPOSIX -MList::Util=min -E "say min(14, floor((log($GENOMESIZE) / log(2)) / 2 - 1))")
INDEXNBASES="--genomeSAindexNbases $INDEXNBASES"



CMD="STAR --runMode genomeGenerate --runThreadN 10 --genomeDir ./ --genomeFastaFiles genome.fa $INDEXNBASES $GTF"
echo "$CMD"
eval $CMD

