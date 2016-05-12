# bzip2-1.0.6-install-README.md

bzip2/1.0.6
===========

<http://www.bzip.org/>


Log
---

Would this be an upgrade?

    bzip2 --version

Yes, Uppmax has 1.0.5.

    cd /sw/libs
    mkdir bzip2
    cd bzip2/
    mkdir 1.0.6 mf
    cd 1.0.6/
    mkdir milou tintin src
    cd milou/
    export D=$PWD
    cd ../src/
    wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz

    tar xzf bzip2-1.0.6.tar.gz 
    cd bzip2-1.0.6/
    vi Makefile

Edit `Makefile` so `PREFIX=` points to `$D` which we set above.

    make
    make install

This makes the static library, now make the shared library.

    make clean
    make -f Makefile-libbz2_so
    mv libbz2.so.1.0* ../../milou/lib/

Start with mf from zlib, but remove pkgconfig stuff, change man path, keep the
module load Wes added.

    cd ../../../mf
    cp /sw/mf/common/libraries/zlib/1.2.8 1.0.6

Fixup.

    cd ../..
    fixup -g bzip2

