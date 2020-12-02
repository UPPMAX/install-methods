boost/1.60.0_gcc5.3.0
=====================

<https://www.boost.org>

LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.60.0
    GCCVERSION=5.3.0
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION
    mkdir src
    PREFIX=$PWD/$CLUSTER
    cd src
    SRCVERSION=${BOOSTVERSION//./_}
    test -e boost_${SRCVERSION}.tar.bz2 || wget https://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_${SRCVERSION}.tar.bz2
    tar xjf boost_${SRCVERSION}.tar.bz2
    mv boost_${SRCVERSION} boost_${SRCVERSION}-$CLUSTER
    cd boost_${SRCVERSION}-$CLUSTER

    module load gcc/$GCCVERSION

    ./bootstrap.sh --prefix=$PREFIX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${SRCVERSION}-$CLUSTER

