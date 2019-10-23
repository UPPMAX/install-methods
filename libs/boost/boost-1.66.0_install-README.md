boost/1.66.0
============

Build boost with default system gcc tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.66.0
    VERSION=${BOOSTVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir src
    mkdir -p $CLUSTER
    for CL in irma snowy bianca ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    wget https://dl.bintray.com/boostorg/release/${BOOSTVERSION}/source/boost_${BOOSTVERSION//./_}.tar.bz2
    tar xjf boost_${BOOSTVERSION//./_}.tar.bz2
    cd boost_${BOOSTVERSION//./_}

    ./bootstrap.sh --prefix=$PREFIX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}

