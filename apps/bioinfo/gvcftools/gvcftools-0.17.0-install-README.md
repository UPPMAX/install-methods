gvcftools 0.17.0
================

Manipulate GVCF files.

<https://sites.google.com/site/gvcftools/home>

<https://github.com/sequencing/gvcftools>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=0.17.0
    cd /sw/apps/bioinfo/
    mkdir gvcftools
    cd gvcftools
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/sequencing/gvcftools/releases/download/v${VERSION}/gvcftools-${VERSION}.tar.gz
    tar xzf gvcftools-${VERSION}.tar.gz 
    cd gvcftools-${VERSION}/
    make

Now make sure no dynamic libs to worry about.

    cd bin
    ldd break_blocks 
    ldd trio
    ldd twins 
    cd ..

And move the bin/ directory to the cluster directory.

    mv bin ../../$CLUSTER/

Now do the same on tintin.

