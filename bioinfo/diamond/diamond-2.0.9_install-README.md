diamond/2.0.9
=============

<https://github.com/bbuchfink/diamond>

Used under license:
GPL v3

Structure creating script (makeroom_diamond_2.0.9.sh) moved to /sw/bioinfo/diamond/makeroom_2.0.9.sh

LOG
---

    TOOL=diamond
    VERSION=2.0.9
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "alignment" -w "https://github.com/bbuchfink/diamond" -l "GPL v3" -d "sequence aligner for protein and translated DNA searches\\, designed for high performance analysis of big sequence data"
    ./makeroom_diamond_${VERSION}.sh
    source SOURCEME_diamond_${VERSION}.sh

Use precompiled 64-bit binaries, which already include blast database support.

    cd $SRCDIR
    wget https://github.com/bbuchfink/diamond/releases/download/v${VERSION}/diamond-linux64.tar.gz
    tar xf diamond-linux64.tar.gz

    mkdir $PREFIX/bin
    cp -av diamond $PREFIX/bin

Point to online docs in mf file.
