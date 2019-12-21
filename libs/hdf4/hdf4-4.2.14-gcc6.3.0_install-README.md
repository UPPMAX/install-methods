hdf4/4.2.14-gcc6.3.0
====================

<https://support.hdfgroup.org/products/hdf4/>

Used under license:


Structure creating script (makeroom_hdf4_4.2.14-gcc6.3.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/hdf4/makeroom_4.2.14-gcc6.3.0.sh

Libraries and tools supporting a high-performance file format for scientific data.

This also provides 'compiler' wrappers `h4cc` and `h4fc` so I chose to make the gcc compiler version explicit.

Log
---

    TOOL=hdf4
    TOOLVERSION=4.2.14
    GCCVERSION=6.3.0
    VERSION=${TOOLVERSION}-gcc${GCCVERSION}
    cd /sw/libs
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://support.hdfgroup.org/products/hdf4/ -c libs -d "Data file format"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd hdf4/
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION
    cd src
    wget https://support.hdfgroup.org/ftp/HDF/releases/HDF${TOOLVERSION}/src/CMake-hdf-${TOOLVERSION}.tar.gz
    wget https://support.hdfgroup.org/ftp/HDF/releases/HDF${TOOLVERSION}/src/hdf-${TOOLVERSION}.tar.gz
    # tar xzf CMake-hdf-${TOOLVERSION}.tar.gz
    tar xzf hdf-${TOOLVERSION}.tar.gz
    cd hdf-${TOOLVERSION}
    module load gcc/$GCCVERSION
    module load szip/2.1.1
    module load zlib/1.2.11
    ./configure --prefix=$PREFIX --with-szlib=$SZIP_ROOT --with-zlib=$ZLIB_ROOT --enable-shared=yes --disable-fortran
    make 2>&1 | tee make.out
    make check 2>&1 | tee check.out
    make install
    make installcheck
    cd ../../..
    cd mf

Start with mf from zlib, no pkg config but everything else OK.

    cp /sw/mf/common/libraries/zlib/1.2.8 4.2.11_gcc4.9.2
    vi 4.2.11_gcc4.9.2

Now set it up, and repeat the above for tintin.


Currently Loaded Modules:
  1) uppmax   2) szip/2.1.1   3) cmake/3.13.2   4) zlib/1.2.11   5) gcc/6.3.0

 

