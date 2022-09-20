HLA-HD/1.4.0
========================

<https://www.genome.med.kyoto-u.ac.jp/HLA-HD/>

Used under license:
other


Structure creating script (makeroom_HLA-HD_1.4.0.sh) moved to /sw/bioinfo/HLA-HD/makeroom_1.4.0.sh

LOG
---


TOOL=HLA-HD
VERSION=1.4.0
GCCVERSION=9.3.0


makeroom.sh -t $TOOL -v $VERSION   -f -w "https://www.genome.med.kyoto-u.ac.jp/HLA-HD/"  -c "bioinfo" -s "misc"  -d "HLA-HD (HLA typing from High-quality Dictionary) can accurately determine HLA alleles with 6-digit precision from NGS data (fastq format). RNA-Seq data can also be applied." -l "other"

 ./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}

ml bioinfo-tools   bowtie2/2.3.5.1

cd hlahd.1.4.0]
./install.sh


