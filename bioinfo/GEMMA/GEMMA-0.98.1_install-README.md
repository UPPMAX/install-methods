GEMMA/0.98.1
========================

<http://www.xzlab.org/software.html>

Used under license:
GPL3

LOG
---

    TOOL=GEMMA
    VERSION=0.98.1
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_GEMMA_0.98.1.sh

Structure creating script (makeroom_GEMMA_0.98.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/GEMMA/makeroom_0.98.1.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget https://github.com/genetics-statistics/GEMMA/releases/download/0.98.1/gemma-0.98.1-linux-static.gz
    gunzip gemma-0.98.1-linux-static.gz
    chmod a+x gemma-0.98.1-linux-static
    mv gemma-0.98.1-linux-static ../rackham/
