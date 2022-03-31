ATLAS 3.10.3 
============

ATLAS (Automatically Tuned Linear Algebra Software) library with LAPACK and
BLAS/CBLAS.  Include full LAPACK library, and build with system gcc.

This would be much easier with EasyBuild.

<http://math-atlas.sourceforge.net/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.10.3
    cd /sw/libs
    mkdir ATLAS
    cd ATLAS
    mkdir $VERSION
    cd $VERSION/
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER/
    PREFIX=$PWD
    cd ../src_$CLUSTER/
    [[ -f lapack-3.8.0.tar.gz ]] || wget http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
    NETLIB_LAPACK=$PWD/lapack-3.8.0.tar.gz
    [[ -f atlas${VERSION}.tar.bz2 ]] || wget http://downloads.sourceforge.net/project/math-atlas/Stable/${VERSION}/atlas${VERSION}.tar.bz2
    tar xf atlas${VERSION}.tar.bz2 
    cd ATLAS/
    mkdir build
    cd build

    ../configure --prefix=$PREFIX  --shared -Fa alg -fPIC --with-netlib-lapack-tarfile=$NETLIB_LAPACK --cripple-atlas-performance

    make
    make install

Ensure 64-bit compilation.

    cd $PREFIX/lib
    ar xv liblapack.a ATL_dgelq2.o
    file ATL_dgelq2.o
    rm ATL_dgelq2.o 

