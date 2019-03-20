SURVIVOR/1.0.3
========================
<https://github.com/fritzsedlazeck/SURVIVOR>
LOG
---
I did..
    TOOL=SURVIVOR
    VERSION=1.0.3
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/marcusl/bin/makeroom.sh
NOTE: I use my own script which is located at /sw/apps/bioinfo/SURVIVOR/makeroom_1.0.3.sh
    ./makeroom_SURVIVOR_1.0.3.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/fritzsedlazeck/SURVIVOR.git
    cd SURVIVOR/Debug
    make
    cp SURVIVOR $PREFIX/
