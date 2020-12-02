schmutzi/20200706-597c6bc
=========================

<https://github.com/grenaud/schmutzi>

Used under license:
GPL v3

LOG
---

    TOOL=schmutzi
    COMMIT=597c6bc
    VERSION=20200706-$COMMIT
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/grenaud/schmutzi -d "Bayesian maximum a posteriori contamination estimate for ancient samples" -l "GPL v3"
    ./makeroom_schmutzi_20200706-597c6bc.sh 
    source SOURCEME_schmutzi_20200706-597c6bc 
    cd $SRCDIR
    ml git/2.28.0
    ml cmake/3.17.3
    ml gcc/9.3.0
    ml perl/5.26.2 perl_modules/5.26.2
    ml R/4.0.0 R_packages/4.0.0
    ml zlib/1.2.11
    git clone --recursive https://github.com/grenaud/schmutzi.git
    cd schmutzi/
    git reset --head $COMMIT

Remove hardcoded path to /usr/bin/g++, just make g++

    vi src/Makefile src/splitEndoVsCont/Makefile

And, build bamtools separately so it finds the new zlib.

    cd lib/bamtools
    mkdir build
    cd build
    cmake .. -DZLIB_INCLUDE_DIR:PATH=$ZLIB_ROOT/include -DZLIB_LIBRARY_RELEASE:FILEPATH=$ZLIB_ROOT/lib/libz.so
    make -j 4
    cd $SRCDIR/schmutzi

And build the rest.

    make

The installation procedure assumes installing into /usr.  Get around that, first for the executables.

    make -i install |&  grep -F -- '->' | sed -e "s,/usr,$PREFIX," -e 's/->//' -e 's/^/cp -av /' | bash

Then for the /usr/share resources.

    cp -rfv share/schmutzi $PREFIX/share

Copy a python script over.

    cp fasta2haplogrep.py $PREFIX/bin

And fix up some #! lines.

    cd $PREFIX/bin
    sed -i 's,#!/usr/bin/perl$,#!/usr/bin/env perl,' *.pl

Double-check that R, python and perl scripts have correct headers

    head -n 1 *.pl *.R *.py

### Running tests.

Test with the installed module.  The mf file loads perl, perl_modules, R and R_packages modules.

Once that's loaded, go to $SRCDIR/schmutzi and do

    make testdata/

Then

    contDeam.pl  --library single --out outputdir/mez testdata/mezB9687.bam
    contDeam.pl  --library double --out outputdir/sim testdata/simulation.bam
    schmutzi.pl       --uselength   --ref share/schmutzi/refs/human_MT_wrapped.fa         outputdir/mez   $SCHMUTZI_ROOT/share/schmutzi/alleleFreqMT/197/freqs/  testdata/mezB9687.bam

