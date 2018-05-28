
BEDTools/2.25.0
===============

<http://bedtools.readthedocs.io/en/latest/>

LOG
---

    VERSION=2.27.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/BEDTools
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd src
    [[ -f bedtools-${VERSION}.tar.gz ]] || wget https://github.com/arq5x/bedtools2/releases/download/v${VERSION}/bedtools-${VERSION}.tar.gz
    [[ -d bedtools2 ]] && rm -rf bedtools2
    tar xzf bedtools-${VERSION}.tar.gz 
    cd bedtools2/
    module load gcc/6.4.0
    make clean
    make -j 8
    cp -av bin ../../$CLUSTER
    cd ..
    rm -rf bedtools2 

