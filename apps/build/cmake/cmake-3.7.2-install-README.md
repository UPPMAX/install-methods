cmake/3.7.2
===========

<https://cmake.org/>

LOG
---

    VERSION=3.7.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOL=/sw/apps/build/cmake
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f cmake-$VERSION.tar.gz ]] || wget https://cmake.org/files/v${VERSION%.*}/cmake-$VERSION.tar.gz
    tar xzf cmake-$VERSION.tar.gz 
    cd cmake-$VERSION
    module load gcc/6.3.0
    ./bootstrap --prefix=$PFX
    make
    make install

