blas 3.6.0
============

BLAS (Basic Linear Algebra Subprograms) with CBLAS

<http://www.netlib.org/blas/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.6.0
    cd /sw/libs
    mkdir blas
    cd blas
    mkdir $VERSION
    cd $VERSION/
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER/
    PREFIX=$PWD
    cd ../src_$CLUSTER/

BLAS...

    module load gcc/4.9.2
    wget http://www.netlib.org/blas/blas-${VERSION}.tgz
    tar xzf blas-${VERSION}.tgz 
    cd BLAS-${VERSION}/
    make
    mkdir $PREFIX/lib
    cp blas_LINUX.a $PREFIX/lib/
    cd $PREFIX/lib/
    ln -s blas_LINUX.a libblas.a

CBLAS...

    cd /sw/libs/blas/$VERSION/src_$CLUSTER
    wget http://www.netlib.org/blas/blast-forum/cblas.tgz
    tar xzf cblas.tgz 
    cd CBLAS/
    mv Makefile.in Makefile.in.orig
    ln -s Makefile.LINUX Makefile.in

    export VERSION CLUSTER
    vi Makefile.LINUX

Modify `BLLIB` in Makefile.LINUX to point to the BLAS library.

    BLLIB = /sw/libs/blas/$(VERSION)/$(CLUSTER)/lib/libblas.a

Exit after the above modification, build and install library and header files.

    make
    cd lib
    cp cblas_LINUX.a $PREFIX/lib/
    cd ..
    cp -av include $PREFIX/
    cd $PREFIX/lib/
    ln -s cblas_LINUX.a libcblas.a

