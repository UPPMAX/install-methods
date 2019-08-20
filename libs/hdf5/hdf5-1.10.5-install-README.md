hdf5/1.10.5
====================

<https://www.hdfgroup.org/HDF5/>

Log
---

Build with system gcc.  Something like

    TOOLVERSION=1.10.5
    VERSION=${TOOLVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p hdf5
    cd hdf5
    mkdir -p mf
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    PREFIX=$PWD/$CLUSTER
    mkdir -p src
    cd src
    [[ -f hdf5-${TOOLVERSION}.tar.bz2 ]] || wget https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-${TOOLVERSION}.tar.bz2
    tar xjf hdf5-${TOOLVERSION}.tar.bz2 
    cd hdf5-${TOOLVERSION}
    module load szip/2.1.1
    module load zlib/1.2.11
    ./configure --prefix=$PREFIX --with-szlib=$SZIP_ROOT --with-zlib=$ZLIB_ROOT --enable-fortran --enable-fortran2003 --enable-cxx --with-gnu-ld
    make 2>&1 | tee make.out
    make check 2>&1 | tee check.out
    make install
    make installcheck
