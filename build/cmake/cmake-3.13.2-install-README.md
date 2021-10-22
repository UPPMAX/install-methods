cmake/3.13.2
============

<https://cmake.org/>

LOG
---

    VERSION=3.13.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOL=/sw/apps/build/cmake
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ $CLUSTER = rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f cmake-$VERSION.tar.gz ]] || wget --timestamping https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz
    tar xzf cmake-$VERSION.tar.gz 
    cd cmake-$VERSION
    module load gcc/7.3.0
    ./bootstrap --prefix=$PFX
    make
    make install


