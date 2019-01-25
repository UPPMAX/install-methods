# GERP++-20110522-install-README.md

GERP++
======

Genomic Evolutionary Rate Profiling

<http://mendel.stanford.edu/SidowLab/downloads/gerp/index.html>

Log
---

    cd /sw/apps/bioinfo
    mkdir GERP++
    cd GERP++/
    mkdir 20110522
    cd 20110522/
    mkdir src milou
    cd src
    wget http://mendel.stanford.edu/SidowLab/downloads/gerp/gerp++.tar.gz
    tar xzf gerp++.tar.gz 

Had to make some changes to the source and Makefile to get this to compile.
Used the system gcc since this is old code.

    diff orig-src/Constants.h src/Constants.h

    24a25
    > #include <ios>
    diff orig-src/etree.cc src/etree.cc
    23a24
    > #include <cstdlib>
    diff orig-src/gerpcol.cc src/gerpcol.cc
    22a23,24
    > #include <algorithm>
    > #include <cstdlib>
    diff orig-src/gerpelem.cc src/gerpelem.cc
    21a22
    > #include <algorithm>
    23a25
    > #include <cstring>
    diff orig-src/Makefile src/Makefile
    1c1
    < GENERAL_OPTIONS  = -Wall -W -pedantic
    ---
    > GENERAL_OPTIONS  = -Wall -D_FILE_OFFSET_BITS=64 -std=c++0x
    3c3
    < OPTIMIZE_OPTIONS = -O4
    ---
    > OPTIMIZE_OPTIONS = -O3

Build and copy.

    make
    cp -pv gerpcol gerpelem ../milou/

Now get all the precompiled data tracks.

    cd ../milou
    mkdir data
    cd data
    for S in http://mendel.stanford.edu/SidowLab/downloads/gerp/hg19.GERP_scores.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/hg19.GERP_elements.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/hg18.GERP_scores.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/hg18.GERP_elements.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/mm9.GERP_scores.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/mm9.GERP_elements.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/Readme.txt
    do 
        wget "$S"
    done


