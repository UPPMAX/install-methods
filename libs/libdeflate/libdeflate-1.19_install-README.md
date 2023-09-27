libdeflate/1.19
===============

<https://github.com/ebiggers/libdeflate>

Used under license:
MIT


Structure creating script (makeroom_libdeflate_1.19.sh) moved to /sw/libs/libdeflate/makeroom_1.19.sh

LOG
---

    makeroom.sh -c libs -t libdeflate -v 1.19 -l MIT -w https://github.com/ebiggers/libdeflate -d "Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
    ./makeroom_libdeflate_1.19.sh 
    source /sw/libs/libdeflate/SOURCEME_libdeflate_1.19
    cd $SRCDIR
    ml cmake/3.26.3
    ml gcc/12.3.0
    wget https://github.com/ebiggers/libdeflate/releases/download/v1.19/libdeflate-1.19.tar.gz
    tar xf libdeflate-1.19.tar.gz 
    cd libdeflate-1.19/
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make -j10
    make install

    cd $PREFIX
    ln -s lib64 lib
