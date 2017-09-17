boost/1.55.0_gcc4.8.3
=====================

<https://www.boost.org>

Build a fresh boost/1.55.0 with an older gcc tool stack.  The 1.5x versions use `./bjam`.

LOG
---

    TOOL=/sw/apps/build/boost
    BOOSTVERSION=1.55.0
    GCCVERSION=4.8.3
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION/$CLUSTER
    PFX=$PWD
    cd ../../src
    tar xzf boost_${BOOSTVERSION//./_}.tar.gz
    mv boost_${BOOSTVERSION//./_} boost_${BOOSTVERSION//./_}-$CLUSTER
    cd boost_${BOOSTVERSION//./_}-$CLUSTER

    module load gcc/$GCCVERSION

    ./bootstrap.sh --prefix=$PFX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}-$CLUSTER

