albacore/4aee41d
========================

<https://github.com/dvera/albacore>

LOG
---

    TOOL=albacore
    VERSION=4aee41d
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_albacore_4aee41d.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    singularity build albacore.img docker://genomicpariscentre/albacore
    cd ../rackham
    mv ../src/albacore.img .

