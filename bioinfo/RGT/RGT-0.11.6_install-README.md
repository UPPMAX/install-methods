RGT/0.11.6
========================

<https://www.regulatory-genomics.org/>

Used under license:
GPL3

LOG
---

    TOOL=RGT
    VERSION=0.11.6
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/bioinfo/RGT/makeroom_0.11.6.sh
    
    ./makeroom_RGT_0.11.6.sh
    module load python/2.7.15
    export RGTDATA=$PREFIX/rgtdata
    pip install --target $PREFIX RGT

    cd /sw/bioinfo/RGT/0.11.6/src
    git clone https://github.com/CostaLab/reg-gen.git

    cd $PREFIX
    mkdir rgtdata
    cd rgtdata
    cp -av ../../src/reg-gen/data/* .
    python setupGenomicData.py --all

