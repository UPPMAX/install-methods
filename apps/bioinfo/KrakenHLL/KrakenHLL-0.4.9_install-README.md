KrakenHLL/0.4.9
========================

<http://>

LOG
---

I did..

    TOOL=KrakenHLL
    VERSION=0.4.9
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/KrakenHLL/makeroom_0.4.9.sh

    ./makeroom_KrakenHLL_0.4.9.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    wget https://github.com/fbreitwieser/krakenhll/archive/v0.4.9.tar.gz
    tar xfz v0.4.9.tar.gz
    cd krakenhll-0.4.9/
    ml jellyfish
    mkdir -p $VERSIONDIR/rackham/bin
    INSTALLDIR=$VERSIONDIR/rackham/bin
    ml gcc/6.3.0
    ./install_krakenhll.sh $INSTALLDIR

