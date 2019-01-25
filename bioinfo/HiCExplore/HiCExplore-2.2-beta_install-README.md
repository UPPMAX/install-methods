HiCExplore/2.2-beta
========================

<https://github.com/deeptools/HiCExplorer>

LOG
---

    TOOL=HiCExplore
    VERSION=2.2-beta
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/HiCExplore/makeroom_2.2-beta.sh
    ./makeroom_HiCExplore_2.2-beta.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/deeptools/HiCExplorer.git
    cd HiCExplorer
    ml python/2.7.15
    python setup.py install --prefix $PREFIX

