boost/1.70.0_intel18.3
======================

Build boost with Intel tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.70.0
    INTELVERSION=18.3
    VERSION=${BOOSTVERSION}_intel${INTELVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do { test -L $CL || ln -s $CLUSTER $CL; } ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    wget https://dl.bintray.com/boostorg/release/${BOOSTVERSION}/source/boost_${BOOSTTARBALLVERSION}.tar.bz2
    tar xjf boost_${BOOSTTARBALLVERSION}.tar.bz2
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load intel/$INTELVERSION

    ./bootstrap.sh --with-toolset=intel-linux --prefix=$PFX
    ./b2
    ./b2 install --prefix=$PFX

    cd ..
    rm -rf boost_${BOOSTVERSION}

