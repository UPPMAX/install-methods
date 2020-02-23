PRSice/2.2.11.b
========================

<https://www.prsice.info/>

Used under license:
GPL3

Structure creating script (makeroom_PRSice_2.2.11.b.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/PRSice/makeroom_2.2.11.b.sh

LOG
---

    TOOL=PRSice
    VERSION=2.2.11.b
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_PRSice_2.2.11.b.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    ml cmake
    mkdir build
    cd build
    cmake ../
    make
    cd ..
    mv PRSice ../
    cd ..
    rmdir rackham
    mv PRSice rackham
