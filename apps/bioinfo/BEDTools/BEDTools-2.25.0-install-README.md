BEDTools/2.25.0
===============

<http://bedtools.readthedocs.io/en/latest/>

LOG
---

    VERSION=2.25.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/BEDTools
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd src
    wget https://github.com/arq5x/bedtools2/releases/download/v${VERSION}/bedtools-${VERSION}.tar.gz
    tar xzf bedtools-${VERSION}.tar.gz 
    cd bedtools2/
    module load gcc/6.4.0
    make clean
    make -j 20
    cp -av bin ../../$CLUSTER

