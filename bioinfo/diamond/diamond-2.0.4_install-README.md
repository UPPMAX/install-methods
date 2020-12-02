diamond/2.0.4
========================

<https://github.com/bbuchfink/diamond>

Used under license:
GPL v3
<>

Structure creating script (makeroom_diamond_2.0.4.sh) moved to /sw/bioinfo/diamond/makeroom_2.0.4.sh

LOG
---

    TOOL=diamond
    VERSION=2.0.4
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/diamond/2.0.4/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -f -t "diamond" -v "2.0.4" -s "alignment" -w "https://github.com/bbuchfink/diamond" -l "GPL v3" -d "sequence aligner for protein and translated DNA searches\\, designed for high performance analysis of big sequence data"
    ./makeroom_diamond_2.0.4.sh


    source SOURCEME_diamond_2.0.4.sh

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

