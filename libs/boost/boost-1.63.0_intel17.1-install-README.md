boost/1.63.0_intel17.1
=====================

Build boost with intel tool stack.

<https://www.boost.org>

LOG
---

    TOOL=/sw/apps/build/boost
    BOOSTVERSION=1.63.0
    INTELVERSION=17.1
    VERSION=${BOOSTVERSION}_intel${INTELVERSION}
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

    module load intel/$INTELVERSION

    ./bootstrap.sh --with-toolset=intel-linux --prefix=$PFX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}-$CLUSTER

