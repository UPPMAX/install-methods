CIRCexplorer/1.1.10
========================

<https://github.com/YangLab/CIRCexplorer>

LOG
---

I did..

    TOOL=CIRCexplorer
    VERSION=1.1.10
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/CIRCexplorer/makeroom_1.1.10.sh

    ./makeroom_CIRCexplorer_1.1.10.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/YangLab/CIRCexplorer.git
    PREFIX=$VERSIONDIR/$CLUSTER
    ml bioinfo-tools python/2.7.11 pysam/0.13-python2.7.11
    PYTHONUSERBASE=$PREFIX pip install --user docopt
    PYTHONUSERBASE=$PREFIX python setup.py install --user

