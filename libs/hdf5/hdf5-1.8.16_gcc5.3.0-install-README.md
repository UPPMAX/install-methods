# hdf5-1.8.16_gcc5.3.0-install-README.md

hdf5/1.8.16_gcc5.3.0
====================

<https://www.hdfgroup.org/HDF5/>


Log
---

Something like

    TOOLVERSION=1.8.16
    GCCVERSION=5.3.0
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
    [[ -f hdf5-${TOOLVERSION}.tar.bz2 ]] || wget https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-${TOOLVERSION}/src/hdf5-${TOOLVERSION}.tar.bz2
    tar xjf hdf5-${TOOLVERSION}.tar.bz2 
    mv hdf5-${TOOLVERSION} hdf5-${VERSION}_${CLUSTER}
    cd hdf5-${VERSION}_${CLUSTER}
    module load gcc/$GCCVERSION
    module load szip/2.1_gcc$GCCVERSION
    module load zlib/1.2.8
    ./configure --prefix=/sw/libs/hdf5/$VERSION/$CLUSTER --with-szlib=/sw/libs/szip/2.1_gcc$GCCVERSION/$CLUSTER --with-zlib=/sw/libs/zlib/1.2.8 --enable-fortran --enable-fortran2003 --enable-cxx
    make >& make.out
    make check >& check.out
    make install
    make installcheck
