prank/170427
============

They now provide precompiled binaries!  Unfortunately they will not work on milou (gcc 2.14).

<http://wasabiapp.org/software/prank/>

LOG
---

    TOOL=/sw/apps/bioinfo/prank
    VERSION=170427
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    CC=rackham
    mkdir $CC
    for C in bianca irma ; do ln -s $CC $C; done
    cd $CC
    PFX=$PWD
    mkdir -p share/man/man1
    cd ../src
    [[ -f prank.linux64.${VERSION}.tgz ]] || wget http://wasabiapp.org/download/prank/prank.linux64.${VERSION}.tgz
    tar xzf prank.linux64.${VERSION}.tgz
    cd prank
    cp -av bin $PFX/
    cp -av prank.1 $PFX/share/man/man1/
    cd ..
    rm -rf prank
