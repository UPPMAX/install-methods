MACS/2.1.2
========================

<https://github.com/taoliu/MACS>

LOG
---

    TOOL=MACS
    VERSION=2.1.2
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_MACS_2.1.2.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/
    module load python/2.7.15
    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages
    pip install --install-option="--prefix=$PREFIX" MACS2==2.1.2.1
