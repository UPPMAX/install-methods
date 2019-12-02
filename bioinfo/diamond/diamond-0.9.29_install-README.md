diamond/0.9.29
========================

<https://github.com/bbuchfink/diamond>

Used under license:
GPL v3

Structure creating script (makeroom_diamond_0.9.29.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/diamond/makeroom_0.9.29.sh

LOG
---

    cd /sw/bioinfo/diamond
    makeroom.sh -f -t diamond -v 0.9.29 -s alignment -w https://github.com/bbuchfink/diamond -l "GPL v3" -d "sequence aligner for protein and translated DNA searches, designed for high performance analysis of big sequence data"
    ./makeroom_diamond_0.9.29.sh 
    source SOURCEME_diamond_0.9.29

    cd $VERSIONDIR/src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd diamond-$VERSION
    module load cmake/3.13.2
    module load zlib/1.2.11
    module load gcc/8.3.0

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DZLIB_ROOT=$ZLIB_ROOT ..
    make
    make install

Make sure RPATH info is correct.

    module unload gcc zlib cmake
    cd $PREFIX/bin
    ldd diamond

Get local copy of the manual.

    cd $PREFIX/..
    wget https://github.com/bbuchfink/diamond/raw/master/diamond_manual.pdf

