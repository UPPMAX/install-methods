diamond/2.1.9
=============

<https://github.com/bbuchfink/diamond>

Used under license:
GPL v3

Structure creating script (makeroom_diamond_2.1.9.sh) moved to /sw/bioinfo/diamond/makeroom_2.1.9.sh

LOG
---

    TOOL=diamond
    VERSION=2.1.9

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "alignment" -w "https://github.com/bbuchfink/diamond" -l "GPL v3" -d "sequence aligner for protein and translated DNA searches\\, designed for high performance analysis of big sequence data"
    ./makeroom_diamond_${VERSION}.sh

    source /sw/bioinfo/$TOOL/SOURCEME_diamond_${VERSION}
    cd $SRCDIR

Use precompiled 64-bit binaries, which already include blast database support.

    wget https://github.com/bbuchfink/diamond/releases/download/v${VERSION}/diamond-linux64.tar.gz
    tar xf diamond-linux64.tar.gz

    mkdir $PREFIX/bin
    cp -av diamond $PREFIX/bin

Wrap up. Modify the 2.0.4 mf and make sure this one is a symlink to that.

The manual is the github wiki, now, at <https://github.com/bbuchfink/diamond/wiki>

