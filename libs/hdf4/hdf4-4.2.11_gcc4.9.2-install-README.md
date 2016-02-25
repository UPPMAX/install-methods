# hdf4-4.2.11_gcc4.9.2-install-README.md

hdf4/4.2.11_gcc4.9.2
====================

Libraries and tools supporting a high-performance file format for scientific data.

<https://www.hdfgroup.org/products/hdf4/>

This also provides 'compiler' wrappers `h4cc` and `h4fc` so I chose to make the gcc compiler version explicit.

Log
---

    cd /sw/libs/
    mkdir hdf4
    cd hdf4/
    mkdir 4.2.11_gcc4.9.2 mf
    cd 4.2.11_gcc4.9.2
    mkdir src 
    cd src
    wget http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.11.tar
    tar xf hdf-4.2.11.tar 
    mv hdf-4.2.11 hdf-4.2.11-milou
    cd hdf-4.2.11-milou
    module load gcc/4.9.2
    module load szip/2.1
    ./configure --prefix=/sw/libs/hdf4/4.2.11_gcc4.9.2/milou --with-szlib=/sw/libs/szip/2.1_gcc4.9.2/milou
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

