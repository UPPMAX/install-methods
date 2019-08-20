boost/1.70.0_gcc9.1.0
=====================

Build boost with GCC tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.70.0
    GCCVERSION=9.1.0
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    wget https://dl.bintray.com/boostorg/release/${BOOSTVERSION}/source/boost_${BOOSTTARBALLVERSION}.tar.bz2
    tar xjf boost_${BOOSTTARBALLVERSION}.tar.bz2
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load gcc/$GCCVERSION

    ./bootstrap.sh --with-toolset=gcc --prefix=$PFX
    ./b2
    ./b2 install --prefix=$PFX

    cd ..
    rm -rf boost_${BOOSTVERSION}

