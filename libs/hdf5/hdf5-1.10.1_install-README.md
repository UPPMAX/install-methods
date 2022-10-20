hdf5/1.10.1
========================

<https://www.hdfgroup.org/downloads/hdf5/>

Used under license:



Structure creating script (makeroom_hdf5_1.10.1.sh) moved to /sw/libs/hdf5/makeroom_1.10.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hdf5" "-v" "1.10.1" "-w" "https://www.hdfgroup.org/downloads/hdf5/" "-c" "libs" "-f"
    ./makeroom_hdf5_1.10.1.sh
    TOOL=hdf5
    VERSION=1.10.1

# Download and extract
    cd $SRCDIR
    wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.1/src/hdf5-1.10.1.tar.gz
    tar xfvz hdf5-1.10.1.tar.gz -C $PREFIX --strip-components 1

# Make
    cd $PREFIX

    module load zlib/1.2.11
    module load szip/2.1.1
    module load gcc/9.3.0

    ./configure --prefix=$PREFIX --enable-threadsafe --enable-unsupported --enable-fortran --enable-cxx --with-szlib=$SZIP_ROOT --with-zlib=$ZLIB_ROOT

    make |& tee make.out
    make check |& tee check.out
    make install
    make installcheck


















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

