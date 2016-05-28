# coreutils-8.25-install-README.md

coreutils/8.25
==============

GNU coreutils

LOG
---

    VERSION=8.25
    CLUSTER=milou
    cd /sw/apps
    mkdir coreutils
    cd coreutils
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    wget wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/coreutils/coreutils-${VERSION}.tar.xz
    tar xJfv coreutils-${VERSION}.tar.xz
    mv coreutils-${VERSION} coreutils-${VERSION}-$CLUSTER
    cd coreutils-${VERSION}-$CLUSTER
    module load gcc/4.9.2
    ./configure --prefix=/sw/apps/coreutils/$VERSION/$CLUSTER
    make -j 8
    make install

Start with mf from bzip2

    cd ../../../mf
    cp /sw/libs/bzip2/mf/1.0.6 8.25
    vi 8.25 

Remove include-related stuff, add `INFOPATH`.

No reason to include on irma, it is already up to date.

Now build for tintin.
