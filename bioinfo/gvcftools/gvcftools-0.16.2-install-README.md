gvcftools 0.16.2
================

Manipulate GVCF files.

<https://sites.google.com/site/gvcftools/home>

<https://github.com/sequencing/gvcftools>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=0.16.2
    cd /sw/apps/bioinfo/
    mkdir gvcftools
    cd gvcftools
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    [[ "$CLUSTER" = "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -f gvcftools-${VERSION}.tar.gz ]] || wget https://github.com/sequencing/gvcftools/releases/download/v${VERSION}/gvcftools-${VERSION}.tar.gz
    [[ -d gvcftools-${VERSION} ]] && rm -rf gvcftools-${VERSION}
    tar xzf gvcftools-${VERSION}.tar.gz 
    cd gvcftools-${VERSION}/
    make

    cd bin
    ldd break_blocks 
    ldd trio
    ldd twins 
    cd ..

    cp -av bin $PFX/ && cd .. && rm -rf gvcftools-${VERSION}

