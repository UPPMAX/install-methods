hifiasm-meta/0.3.2-r74
======================

<https://github.com/xfengnefx/hifiasm-meta>

Used under license:
MIT


Structure creating script (makeroom_hifiasm-meta_0.3.2-r74.sh) moved to /sw/bioinfo/hifiasm-meta/makeroom_0.3.2-r74.sh

LOG
---

    makeroom.sh -f -t hifiasm-meta -v 0.3.2-r74   -w "https://github.com/xfengnefx/hifiasm-meta"  -c "bioinfo" -s "assembly" -l "MIT" -d  "hifiasm_meta - de novo metagenome assembler, based on hifiasm, a haplotype-resolved de novo assembler for PacBio Hifi reads."
    ./makeroom_hifiasm-meta_0.3.2-r74.sh 
    source /sw/bioinfo/hifiasm-meta/SOURCEME_hifiasm-meta_0.3.2-r74 && cd $SRCDIR
    wget https://github.com/xfengnefx/hifiasm-meta/archive/refs/tags/hamtv0.3.2.tar.gz
    ml gcc/12.3.0 zlib/1.2.13
    tar xf hamtv0.3.2.tar.gz 
    cd hifiasm-meta-hamtv0.3.2/

Edit Makefile to use `-march=native` instead of instruction options

    vi Makefile 
    make -j10
    mkdir -p $PREFIX/{bin,share/man/man1}
    cp -av hifiasm_meta $PREFIX/bin
    cp -av hifiasm_meta.1 $PREFIX/share/man/man1/
    make clean

Now build on s229.

    ssh s229
    source /sw/bioinfo/hifiasm-meta/SOURCEME_hifiasm-meta_0.3.2-r74
    cd $VERSIONDIR
    rm -f snowy
    mkdir snowy
    cd $SRCDIR
    cd hifiasm-meta-hamtv0.3.2/
    make clean
    ml gcc/12.3.0 zlib/1.2.13
    make -j10
    mkdir -p $PREFIX/{bin,share/man/man1}
    cp -av hifiasm_meta $PREFIX/bin
    cp -av hifiasm_meta.1 $PREFIX/share/man/man1/
    make clean

