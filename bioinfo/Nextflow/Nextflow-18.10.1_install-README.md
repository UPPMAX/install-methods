Nextflow/18.10.1
========================

<https://www.nextflow.io>

LOG
---

    TOOL=Nextflow
    VERSION=18.10.1
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/Nextflow/makeroom_18.10.1.sh
    ./makeroom_Nextflow_18.10.1.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    wget -qO- https://get.nextflow.io | bash
    mv nextflow ../rackham/
I use the previous mf, but I don't think that is even necessary.
