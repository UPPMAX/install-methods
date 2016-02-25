# hdf5-1.8.16_gcc4.9.2-install-README.md

hdf5/1.8.16_gcc4.9.2
====================

<https://www.hdfgroup.org/HDF5/>


Log
---

Something like

    cd /sw/libs
    mkdir hdf5
    cd hdf5
    mkdir 1.8.16_gcc4.9.2 mf
    cd 1.8.16_gcc4.9.2
    mkdir src milou tintin
    cd src
    wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.16.tar.bz2
    tar xjf hdf5-1.8.16.tar.bz2 
    mv hdf5-1.8.16 hdf5-1.8.16-gcc4.9.2-milou
    cd hdf5-1.8.16-gcc4.9.2-milou/
    module load gcc/4.9.2
    module load szip/2.1_gcc4.9.2
    ./configure --prefix=/sw/libs/hdf5/1.8.16_gcc4.9.2/milou --with-szlib=/sw/libs/szip/2.1_gcc4.9.2/milou
    make >& make.out
    make check >& check.out
    make install
    make installcheck
