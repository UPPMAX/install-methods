ATLAS 3.10.3 
============

ATLAS (Automatically Tuned Linear Algebra Software) library with LAPACK and BLAS/CBLAS

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
    wget http://downloads.sourceforge.net/project/math-atlas/Stable/${VERSION}/atlas${VERSION}.tar.bz2
    tar xjf atlas${VERSION}.tar.bz2 
    cd ATLAS/

Build requires interior directory and builds static libraries, by default.  Built with gcc/4.9.2.

    mkdir build
    cd build
    module load gcc/4.9.2
    ../configure --prefix=$PREFIX
    make
    make install

Ensure 64-bit compilation.

    cd $PREFIX/lib
    ar xv liblapack.a ATL_dgelq2.o
    file ATL_dgelq2.o
    rm ATL_dgelq2.o 

