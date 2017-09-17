hdf4/4.2.11_gcc4.9.2
====================

Libraries and tools supporting a high-performance file format for scientific data.

<https://www.hdfgroup.org/products/hdf4/>

This also provides 'compiler' wrappers `h4cc` and `h4fc` so I chose to make the gcc compiler version explicit.

Log
---

    REMOTEVERSION=4.2.11
    GCCVERSION=4.9.2
    VERSION=${REMOTEVERSION}_gcc${GCCVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs/
    mkdir hdf4
    cd hdf4/
    mkdir $VERSION mf
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    wget http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-${REMOTEVERSION}.tar
    tar xf hdf-${REMOTEVERSION}.tar 
    mv hdf-${REMOTEVERSION} hdf-${REMOTEVERSION}-${CLUSTER}
    cd hdf-${REMOTEVERSION}-${CLUSTER}
    module load gcc/$GCCVERSION
    module load szip/2.1_gcc4.9.2
    ./configure --prefix=$PFX --with-szlib=/sw/libs/szip/2.1_gcc4.9.2/$CLUSTER
    make >& make.out.milou
    make check >& check.out
    cat check.out 
    make install
    make installcheck
    cd ../../..
    cd mf

Start with mf from zlib, no pkg config but everything else OK.

    cp /sw/mf/common/libraries/zlib/1.2.8 4.2.11_gcc4.9.2
    vi 4.2.11_gcc4.9.2

Now set it up, and repeat the above for tintin.

