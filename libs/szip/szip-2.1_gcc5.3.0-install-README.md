# szip-2.1_gcc5.3.0-install-README.md


szip/2.1_gcc5.3.0
=================

<https://www.hdfgroup.org/HDF5/release/obtain5.html>



Log
---

    TOOLVERSION=2.1
    GCCVERSION=5.3.0
    VERSION=${TOOLVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p szip
    cd szip/
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    mkdir -p $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src
    [[ -f szip-${TOOLVERSION}.tar.gz ]] || wget http://www.hdfgroup.org/ftp/lib-external/szip/$TOOLVERSION/src/szip-${TOOLVERSION}.tar.gz
    tar xzf szip-${TOOLVERSION}.tar.gz 
    mv szip-${TOOLVERSION} szip-${VERSION}_${CLUSTER}
    cd szip-${VERSION}_${CLUSTER}
    module load gcc/$GCCVERSION
    ./configure --prefix=$P
    make
    make install

Repeat for tintin.
