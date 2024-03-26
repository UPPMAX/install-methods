FLASH/2.2.00
========================

<https://github.com/dstreett/FLASH2>

Used under license:
MIT


Structure creating script (makeroom_FLASH_2.2.00.sh) moved to /sw/bioinfo/FLASH/makeroom_2.2.00.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "FLASH" "-v" "2.2.00" "-w" "https://github.com/dstreett/FLASH2" "-c" "bioinfo" "-l" "MIT" "-d" "FLASH, Fast Length Adjustment of SHort reads, is a very accurate fast tool to merge paired-end reads from fragments that are shorter than twice the length of reads. The extended length of reads has a significant positive impact on improvement of genome assemblies." "-f"
    ./makeroom_FLASH_2.2.00.sh
FLASH/1.2.11
============

FLASH read joining tool

Magoc T and Salzberg S.  2011.  FLASH: Fast length adjustment of short 
reads to improve genome assemblies. Bioinformatics 27: 2957-63.

<http://ccb.jhu.edu/software/FLASH/>

LOG
---

    TOOL=/sw/apps/bioinfo/FLASH
    VERSION=1.2.11
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    PFX=$TOOLDIR/$CLUSTER
    mkdir -p $PFX
    cd $TOOL
    mkdir mf
    cd $TOOLDIR
    mkdir src
    cd src
    [[ -f FLASH-${VERSION}.tar.gz ]] || wget http://downloads.sourceforge.net/project/flashpage/FLASH-${VERSION}.tar.gz
    tar xvzf FLASH-${VERSION}.tar.gz 
    cd FLASH-${VERSION}/
    make
    cp -av flash $PFX/

FLASH/2.2.00
========================

<https://github.com/dstreett/FLASH2>

Used under license:
GPL v3


Structure creating script (makeroom_FLASH_2.2.00.sh) moved to /sw/bioinfo/FLASH/makeroom_2.2.00.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "FLASH" "-v" "2.2.00" "-w" "https://github.com/dstreett/FLASH2" "-c" "bioinfo" "-l" "GPL v3" "-d" "FLASH, Fast Length Adjustment of SHort reads, is a very accurate fast tool to merge paired-end reads from fragments that are shorter than twice the length of reads. The extended length of reads has a significant positive impact on improvement of genome assemblies." "-f"
    ./makeroom_FLASH_2.2.00.sh
