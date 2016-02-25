# szip-2.1_gcc4.9.2-install-README.md


szip/2.1_gcc4.9.2
=================

<https://www.hdfgroup.org/HDF5/release/obtain5.html>



Log
---

    cd /sw/libs
    mkdir szip
    cd szip/
    mkdir 2.1_gcc4.9.2
    cd 2.1_gcc4.9.2
    mkdir milou tintin src
    cd milou/
    P=$PWD
    cd ../src
    wget http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz
    tar xzf szip-2.1.tar.gz 
    mv szip-2.1 szip-2.1-gcc4.9.2-milou
    cd szip-2.1-gcc4.9.2-milou/
    module load gcc/4.9.2
    ./configure --prefix=$P
    make
    make install

Repeat for tintin.
