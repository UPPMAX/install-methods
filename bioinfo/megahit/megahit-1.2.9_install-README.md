megahit/1.2.9
========================

<https://github.com/voutcn/megahit>

Used under license:
GPL v3
<>

Structure creating script (makeroom_megahit_1.2.9.sh) moved to /sw/bioinfo/megahit/makeroom_1.2.9.sh

LOG
---

    TOOL=megahit
    VERSION=1.2.9
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/megahit/1.2.9/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -f -t "megahit" -v "1.2.9" -s "assembly" -w "https://github.com/voutcn/megahit" -l "GPL v3" -d "MEGAHIT is an ultra-fast and memory-efficient NGS assembler. It is optimized for metagenomes, but also works well on generic single genome assembly (small or mammalian size) and single-cell assembly."
    ./makeroom_megahit_1.2.9.sh
    cd $SRCDIR
    module load zlib/1.2.11  cmake/3.17.3 gcc/10.2.0

    git clone https://github.com/voutcn/megahit.git
    cd megahit
    git submodule update --init
    mkdir build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -DZLIB_ROOT=$ZLIB_ROOT
    make -j4
    make simple_test  # will test MEGAHIT with a toy dataset
Make sure RPATH info is correct.

    module unload gcc zlib cmake
    cd $PREFIX/bin
    ldd megahit_core
