beast2/2.4.8
============

<https://www.beast2.org>

LOG
---

    TOOL=beast2
    VERSION=2.4.8
    CC=milou
    mkdir -p /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    for C in rackham irma bianca ; do rm -f $C && ln -s $CC $C; done
    PFX=$PWD/$CC
    cd ..
    mkdir src
    cd src
    [[ -f BEAST.v${VERSION}.Linux.tgz ]] || wget https://github.com/CompEvol/beast2/releases/download/v${VERSION}/BEAST.v${VERSION}.Linux.tgz
    [[ -d beast ]] && rm -rf beast
    tar xzf BEAST.v${VERSION}.Linux.tgz
    mv beast $PFX

Manually implement the `BEAST_XMX` mechanism for specifying the amount of
memory for the JVM.  This is described in module help.
