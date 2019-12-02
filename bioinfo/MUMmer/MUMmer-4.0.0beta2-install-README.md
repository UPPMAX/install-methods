MUMmer/4.0.0beta2
==================

MUMmer 4.0.0beta2 is available as a release.  There are two commits after this
beta release, but I couldn't get the autoreconf to work after a few minutes so
I am punting.

<https://github.com/mummer4/mummer>


LOG
---

Must the mf file add library directories to `LD_LIBRARY_PATH`?


    TOOL=MUMmer
    VERSION=4.0.0beta2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL; done
    PREFIX=$PWD/$CLUSTER
    cd src
    SRCDIR=$PWD
    [[ -f mummer-${VERSION}.tar.gz ]] || wget https://github.com/mummer4/mummer/releases/download/v${VERSION}/mummer-${VERSION}.tar.gz
    [[ -d mummer-${VERSION} ]] && rm -rf mummer-${VERSION}
    module load gcc/6.3.0
    tar xzf mummer-${VERSION}.tar.gz 
    cd mummer-${VERSION}
    ./configure --prefix=$PREFIX
    make
    make install

Change perl #! lines to use env mechanism.

    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
    sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)

Not necessary to load a perl module.  Also, allowing OpenMP during
configuration.  There is a `--disable-openmp` flag I could set, but I am
leaving it as is.

For the mf file, no need to add library directories to `LD_LIBRARY_PATH`.
There are library and header files but also pkg-config file, so don't add the
library or include directories, but do add `$modroot/lib/pkgconfig` to
`PKG_CONFIG_PATH`.  Add `$modroot/bin` as well as `$modroot/libexec/mummer` to
PATH.


