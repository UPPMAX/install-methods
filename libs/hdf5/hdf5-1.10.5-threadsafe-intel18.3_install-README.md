hdf5/1.10.5
===========

<https://www.hdfgroup.org/HDF5/>

Log
---

Build with system gcc.  Something like

    TOOLVERSION=1.10.5
    INTELVERSION=18.3
    VERSION=${TOOLVERSION}-threadsafe-intel${INTELVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p hdf5
    cd hdf5
    mkdir -p mf
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir -p src
    cd src
    [[ -f hdf5-${TOOLVERSION}.tar.bz2 ]] || wget https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-${TOOLVERSION}.tar.bz2
    tar xjf hdf5-${TOOLVERSION}.tar.bz2 
    cd hdf5-${TOOLVERSION}
    module load intel/$INTELVERSION
    module load zlib/1.2.11
    module load szip/2.1.1
    ./configure --prefix=$PREFIX --enable-threadsafe --enable-unsupported --enable-fortran --enable-cxx --with-szlib=$SZIP_ROOT --with-zlib=$ZLIB_ROOT
    make |& tee make.out
    make check |& tee check.out
    make install
    make installcheck

