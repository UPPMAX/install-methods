fcGENE/1.0.7
========================

<https://sourceforge.net/projects/fcgene/>

Used under license:
GPL

Structure creating script (makeroom_fcGENE_1.0.7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/fcGENE/makeroom_1.0.7.sh

LOG
---

    TOOL=fcGENE
    VERSION=1.0.7
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_fcGENE_1.0.7.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget https://downloads.sourceforge.net/project/fcgene/fcgene-1.0.7.zip
    unzip fcgene-1.0.7.zip
    cd fcgene-1.0.7
    chmod +x configure
    make
    make install
