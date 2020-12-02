MaSuRCA/3.4.2
========================

<https://github.com/alekseyzimin/masurca>

Used under license:
GPL v3

The `install.sh` script recognises a `DEST` variable, but that does not install
`Flye/`, at least.  So, replace `$PREFIX` with the unpacked directory, and
build in place.

Also, ensure that `PATH` is very clean.


LOG
---

    TOOL=MaSuRCA
    VERSION=3.4.2
    cd /sw/bioinfo/${TOOL}/
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/alekseyzimin/masurca -d "genome assembly and analysis toolkit" -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/alekseyzimin/masurca/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${TOOL}-${VERSION} $PREFIX
    cd $PREFIX
    ml gcc/9.3.0
    ml perl/5.26.2 perl_modules/5.26.2
    ./install.sh 

Change headers in CA8, the rest seem ok.

    cd CA8/Linux-amd64/bin/
    for F in $(file * | grep Perl | cut -f1 -d:) ; do sed -i 's,#!.*perl$,#!/usr/bin/env perl,' $F; done

Use mf from 3.3.5.
