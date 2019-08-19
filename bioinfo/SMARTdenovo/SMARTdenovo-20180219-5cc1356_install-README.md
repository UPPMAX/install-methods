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

