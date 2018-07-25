blobtools/1.0
========================

<http://>

LOG
---

I did..

    TOOL=blobtools
    VERSION=1.0
    CLUSTER=rackham
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_blobtools_1.0.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    mkdir $PREFIX
    PYTHONUSERBASE=$PREFIX
    ml gcc/6.3.0 python/2.7.11
    PYTHONUSERBASE=$PREFIX pip install --user matplotlib==2.0.2 docopt==0.6.2 ujson==1.35
    PYTHONUSERBASE=$PREFIX ./install
    cd $PREFIX
    mkdir bin
    cp -av ../src/blobtools/blobtools bin/
    cp -av ../src/blobtools/lib/* lib/
    ln -s ../lib bin/
