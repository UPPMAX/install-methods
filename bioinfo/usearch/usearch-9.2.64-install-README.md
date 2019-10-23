usearch 9.2.64
==============

<http://drive5.com/uparse/>

Log
---

    VERSION=9.2.64
    cd /sw/bioinfo/usearch
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    for CL in irma bianca snow ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    cd $CLUSTER

Get a download link from <http://www.drive5.com/usearch/download.html> emailed to you.
It is a generic Intel Linux executable, good for all clusters here.  Move it to rackham.

    chmod +x usearch${VERSION}_i86linux32
    ln -s usearch${VERSION}_i86linux32 usearch

Add the python scripts.

    mkdir python_scripts
    cd python_scripts/
    wget https://drive5.com/python/python_scripts.tar.gz
    tar xzf python_scripts.tar.gz 
    chmod +x *.py
    sed -i -e 's,#!/usr/bin/python.*$,#!/usr/bin/env python,' $(file * | grep 'Python script' | cut -f1 -d:)
    mv python_scripts.tar.gz ../../src

