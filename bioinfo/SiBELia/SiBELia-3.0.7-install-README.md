SiBELia/3.0.7
=============


<https://sourceforge.net/projects/sibelia-bio/files/>

<http://bioinf.spbau.ru/sibelia>

Change `#!` lines for python and perl scripts.


LOG
---

    cd /sw/bioinfo
    mkdir SiBELia
    cd SiBELia/
    VERSION=3.0.7
    mkdir $VERSION
    cd $VERSION
    CLUSTER=¢{CLUSTER?:CLUSTER must be set}
    mkdir $CLUSTER/ src
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    cd src
    wget https://downloads.sourceforge.net/project/sibelia-bio/${VERSION}/Sibelia-${VERSION}-Linux.tar.gz
    tar xvzf Sibelia-${VERSION}-Linux.tar.gz 
    cd Sibelia-${VERSION}-Linux/
    cp -av * ../../$CLUSTER/
    cd ../../$CLUSTER/bin/
    sed -i -e 's,^#!/usr/bin/python.*$,#!/usr/bin/env python,' *.py
    cd ../lib/Sibelia/lagan
    sed -i -e 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl

For the mf, `bin/Sibelia` executable and some from within `lib/Sibelia/lagan`
are missing C++ libraries, but gcc/6.3.0 satisfies them.  Add the gcc/6.3.0 lib
directories to `LD_LIBRARY_PATH`.
