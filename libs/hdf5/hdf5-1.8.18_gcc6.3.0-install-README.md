hdf5/1.8.18_gcc6.3.0
====================

<https://www.hdfgroup.org/HDF5/>

Log
---

Build with gcc/6.3.0.  Fewer 'cannot reach' messages during compilation.

    TOOLVERSION=1.8.18
    GCCVERSION=6.3.0
    VERSION=${TOOLVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p hdf5
    cd hdf5
    mkdir -p mf
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    mkdir -p src
    cd src
    [[ -f hdf5-${TOOLVERSION}.tar.bz2 ]] || wget https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-${TOOLVERSION}.tar.bz2
    tar xjf hdf5-${TOOLVERSION}.tar.bz2 
    mv hdf5-${TOOLVERSION} hdf5-${VERSION}_${CLUSTER}
    cd hdf5-${VERSION}_${CLUSTER}
    module load gcc/$GCCVERSION
    module load szip/2.1.1
    module load zlib/1.2.11
    ./configure --prefix=/sw/libs/hdf5/$VERSION/$CLUSTER --with-szlib=/sw/libs/szip/2.1.1/$CLUSTER --with-zlib=/sw/libs/zlib/1.2.11/$CLUSTER --enable-fortran --enable-fortran2003 --enable-cxx --with-gnu-ld
    make 2>&1 | tee make.out
    make check 2>&1 | tee check.out
    make install
    make installcheck
