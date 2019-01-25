hichipper/0.7.3
========================

<https://github.com/aryeelab/hichipper>

LOG
---

    TOOL=hichipper
    VERSION=0.7.3
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_hichipper_0.7.3.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/aryeelab/hichipper
    ml python/2.7.15
    PYTHONUSERBASE=$PREFIX python setup.py install --user
