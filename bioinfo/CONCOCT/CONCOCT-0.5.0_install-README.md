CONCOCT/0.5.0
========================

<https://github.com/BinPro/CONCOCT>

LOG
---

    VERSION=0.5.0
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_CONCOCT_0.5.0.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/BinPro/CONCOCT.git
    cd CONCOCT
    module load python/2.7.15
    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages:PYTHONPATH
    python setup.py install --prefix /sw/apps/bioinfo/CONCOCT/0.5.0/rackham/
