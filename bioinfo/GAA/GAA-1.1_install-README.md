GAA/1.1
========================

<https://sourceforge.net/projects/gaa-wugi>

Used under license:
GPL v2+

Structure creating script (makeroom_GAA_1.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/GAA/makeroom_1.1.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "GAA" -v "1.1" -s "assembly" -w "https://sourceforge.net/projects/gaa-wugi" -l "GPL v2+" -d "Merge assemblies"

Unpacked directory becomes `$PREFIX`.  It can find its own local perl modules.
There is also a strange `#!` line in the `gaa.pl` script to fix.

Module requires gsMapper (part of `454-dataanalysis/2.9`) and blat... for which
I'll use our oldest `blat/34`.

Also, test with test data.

LOG
---

    TOOL=GAA
    VERSION=1.1
    cd /sw/bioinfo
    makeroom.sh -t $TOOL -v $VERSION -s assembly -w https://sourceforge.net/projects/gaa-wugi -l "GPL v2+" -d "Merge assemblies" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://downloads.sourceforge.net/project/gaa-wugi/gaa-v${VERSION}.tar
    tar xf gaa-v1.1.tar 
    rmdir $PREFIX
    mv gaa $PREFIX
    cd $PREFIX
    head gaa.pl 
    sed -i 's,^#!.*perl.*$,#!/usr/bin/env perl,' gaa.pl 

