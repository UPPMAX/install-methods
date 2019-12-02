MUMmer 3.9.4alpha ('MUMmer4')
=============================

Fast sequence alignment

<https://github.com/gmarcais/mummer>

LOG
---

    VERSION=3.9.4alpha
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/MUMmer
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/gmarcais/mummer/releases/download/v${VERSION}/mummer-${VERSION}.tar.gz
    module load gcc/6.3.0
    tar xzf mummer-${VERSION}.tar.gz 
    cd mummer-${VERSION}
    ./configure --prefix=$PREFIX
    make
    make install
    cd $PREFIX/bin
    sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)

Adjust all the RPATH information for all executables.

    module load patchelf/0.8
    for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do
        echo $F
        patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F 
    done

