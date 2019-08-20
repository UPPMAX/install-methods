boost/1.63.0_gcc6.3.0
=====================

Build boost with GCC tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/apps/build/boost
    BOOSTVERSION=1.63.0
    GCCVERSION=6.3.0
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION/$CLUSTER
    PFX=$PWD
    cd ../../src
    tar xjf boost_${BOOSTVERSION//./_}.tar.bz2
    mv boost_${BOOSTVERSION//./_} boost_${BOOSTVERSION//./_}-$CLUSTER
    cd boost_${BOOSTVERSION//./_}-$CLUSTER

    module load gcc/$GCCVERSION

    ./bootstrap.sh --prefix=$PFX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}-$CLUSTER

