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
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/sequencing/gvcftools/releases/download/v${VERSION}/gvcftools-${VERSION}.tar.gz
    tar xzf gvcftools-${VERSION}.tar.gz 
    cd gvcftools-${VERSION}/
    make
    bin

Now make sure no dynamic libs to worry about.

    ldd break_blocks 
    ldd trio
    ldd twins 

And move the bin/ directory to the cluster directory.

    mv bin ../../$CLUSTER/

Now do the same on tintin.

