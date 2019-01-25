TIDDIT/2.3.1
========================

<https://github.com/SciLifeLab/TIDDIT.git>

LOG
---

    TOOL=TIDDIT
    VERSION=2.3.1
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/TIDDIT/makeroom_2.3.1.sh
I am cloning the git and renaming it rackham because it expects everything to be under that directory.
    
    ./makeroom_TIDDIT_2.3.1.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/SciLifeLab/TIDDIT.git
    mv TIDDIT rackham
    cd rackham/
    ml python/2.7.15
    ./INSTALL.sh
