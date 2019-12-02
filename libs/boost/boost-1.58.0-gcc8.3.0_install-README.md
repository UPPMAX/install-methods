boost/1.58.0
============

Build boost with default system gcc tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.58.0
    GCCVERSION=8.3.0
    VERSION=${BOOSTVERSION}-gcc${GCCVERSION}
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
    test -f boost_${BOOSTVERSION//./_}.tar.bz2 || wget https://sourceforge.net/projects/boost/files/boost/${BOOSTVERSION}/boost_${BOOSTVERSION//./_}.tar.bz2
    test -d boost_${BOOSTVERSION//./_} || tar xjf boost_${BOOSTVERSION//./_}.tar.bz2
    cd boost_${BOOSTVERSION//./_}

    module load gcc/$GCCVERSION
    ./bootstrap.sh --prefix=$PREFIX
    ./b2
    ./b2 install

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}

