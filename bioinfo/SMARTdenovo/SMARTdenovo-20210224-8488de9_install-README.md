SMARTdenovo/20210224-8488de9
========================

<https://github.com/ruanjue/smartdenovo>

Used under license:
GNU


Structure creating script (makeroom_SMARTdenovo_20210224-8488de9.sh) moved to /sw/bioinfo/SMARTdenovo/makeroom_20210224-8488de9.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "SMARTdenovo" -v "20210224-8488de9" -w "https://github.com/ruanjue/smartdenovo" -l "GNU" -d "SMARTdenovo is a de novo assembler for PacBio and Oxford Nanopore \(ONT\) data."
    ./makeroom_SMARTdenovo_20210224-8488de9.sh
SMARTdenovo/20180219-5cc1356
============================

<https://github.com/ruanjue/smartdenovo>

Used under license:
Misc open source

Structure creating script (makeroom_SMARTdenovo_20180219-5cc1356.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/SMARTdenovo/makeroom_20180219-5cc1356.sh

LOG
---

    TOOL=SMARTdenovo
    VERSION=20180219-5cc1356
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_SMARTdenovo_20180219-5cc1356.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_SMARTdenovo_20180219-5cc1356
    cd $VERSION/src
    module load git/2.21.0
    module load gcc/8.3.0
    git clone https://github.com/ruanjue/smartdenovo.git
    cd smartdenovo/
    make
    sed -i -e 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl
    cp -av * $PREFIX/
    cd $PREFIX
    rm -f *.h *.c
    rm -f Makefile*

