Minimac4/1.0.0
========================

<https://github.com/statgen/Minimac4>

LOG
---

    TOOL=Minimac4
    VERSION=1.0.0
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/Minimac4/makeroom_1.0.0.sh
    ./makeroom_Minimac4_1.0.0.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    ml cmake
    ml python/2.7.15
    pip install --user cget
    git clone https://github.com/statgen/Minimac4.git
    cd Minimac4
    export PATH=~/.local/bin/:$PATH
    ./install.sh
    mv release-build/minimac4 $PREFIX
