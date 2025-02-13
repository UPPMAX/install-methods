mcl/22-282
========================

<https://micans.org/mcl/>

Used under license:
GPL v3
<https://raw.githubusercontent.com/micans/mcl/main/LICENSE>

Structure creating script (makeroom_mcl_22-282.sh) moved to /sw/apps/mcl/makeroom_22-282.sh

LOG
---

    makeroom.sh -f -c apps -t mcl -v 22-282 -w https://micans.org/mcl/ -l "GPL v3" -L "https://raw.githubusercontent.com/micans/mcl/main/LICENSE" -d "MCL, the Markov Cluster algorithm, also known as Markov Clustering, is a method and program for clustering weighted or simple networks, a.k.a. graphs."
    ./makeroom_mcl_22-282.sh 
    source /sw/apps/mcl/SOURCEME_mcl_22-282
    cd $SRCDIR

The install script available at https://github.com/micans/mcl/blob/main/install-mcl-22-282.sh showed there are two tarballs to download, one for cimfomfa which should be compiled and installed first, and then this is referenced when compiling the tarball for mcl.

    ml gcc/12.3.0
    wget http://micans.org/mcl/src/mcl-22-282.tar.gz
    wget http://micans.org/mcl/src/cimfomfa-22-273.tar.gz
    tar xf cimfomfa-22-273.tar.gz 
    cd cimfomfa-22-273/
    ./configure --prefix=$PREFIX --disable-shared
    make
    make check
    make install
    cd ..

    tar xf mcl-22-282.tar.gz 
    cd mcl-22-282/
    ./configure CFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib --prefix=$PREFIX --enable-rcl
    make
    make check
    make install
    cd $PREFIX/bin

There are perl scripts here, and an R script.

The perl scripts use `#!/usr/bin/perl`, so do better.

    sed -i '1i#!/usr/bin/env perl' *.pl
    head -n 2 *.pl

Modules used?

    grep use *.pl

Nothing but standard perl modules.

The R script:

    less rcl-qm.R

This expects non-standard R packages, so add messages about loading an
R_packages module to mf file.

    vi ../../../mf/22-282 

How is this R script referenced, since it has no `#!` line?

    grep rcl-qm.R *

It is referenced by the rcl-qc script providing it as stdin to an invocation of
R.  It expects to find this script using the value of `RCL_SCRIPT_HOME`, which
should be set to `$PREFIX/bin`.  Add this to the mf file.

    vi ../../../mf/22-282 

The other paths from the previous version are fine in the mf file.  Add an `MCL_ROOT`.

    vi ../../../mf/22-282 

Wrap up.

    cd $TOOLDIR
    ./mcl-22-282_post-install.sh
