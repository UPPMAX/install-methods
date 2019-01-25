kourami/0.9.6
========================

<https://github.com/Kingsford-Group/kourami>

LOG
---

    TOOL=kourami
    VERSION=0.9.6
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_kourami_0.9.6.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    wget https://github.com/Kingsford-Group/kourami/releases/download/v0.9.6/kourami-0.9.6_bin.zip
    unzip kourami-0.9.6_bin.zip
    cd ../rackham/
    mkdir bin
    cd bin
    cp -av ../../src/kourami-0.9.6/build/Kourami.jar .
