vcftools/0.1.15
===============

<https://vcftools.github.io/index.html>

LOG
---

    VERSION=0.1.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/vcftools
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f vcftools-${VERSION}.tar.gz ]] || wget https://github.com/vcftools/vcftools/releases/download/v${VERSION}/vcftools-${VERSION}.tar.gz
    tar xzf vcftools-${VERSION}.tar.gz 
    mv vcftools-${VERSION} vcftools-${VERSION}_${CLUSTER}
    cd vcftools-${VERSION}_${CLUSTER}
    module load zlib/1.2.11
    module load gcc/5.4.0
    ./configure --prefix=$PFX
    make -j5
    make install

