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

