SMARTdenovo/20180219-5cc1356
============================

<https://github.com/ruanjue/smartdenovo>

Used under license:
Misc open source

Structure creating script (makeroom_SMARTdenovo_20180219-5cc1356.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/SMARTdenovo/makeroom_20180219-5cc1356.sh

LOG
---

    TOOL=SMARTdenovo
    COMMIT=8488de9
    VERSION=20210224-8488de9
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w "https://github.com/ruanjue/smartdenovo" -l "GNU" -d "SMARTdenovo is a de novo assembler for PacBio and Oxford Nanopore (ONT) data."

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    module load gcc/9.3.0    
    module load git/2.28.0

    git clone https://github.com/ruanjue/smartdenovo.git
    cd smartdenovo/
    git reset --hard $COMMIT

    make
    sed -i -e 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl
    cp -av * $PREFIX/
    cd $PREFIX
    rm -f *.h *.c
    rm -f Makefile*

