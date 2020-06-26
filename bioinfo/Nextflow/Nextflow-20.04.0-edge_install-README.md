Nextflow/20.04.0-edge
========================

<https://github.com/nextflow-io/nextflow>

Used under license:
Apache 2.0

Structure creating script (makeroom_Nextflow_20.04.0-edge.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Nextflow/makeroom_20.04.0-edge.sh

LOG
---

    TOOL=Nextflow
    VERSION=20.04.0-edge
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "Nextflow" -v "20.04.0-edge" -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Apache 2.0" -f"
    ./makeroom_Nextflow_20.04.0-edge.sh
    cd $PREFIX
    wget https://github.com/nextflow-io/nextflow/releases/download/v20.04.0-edge/nextflow-20.04.0-edge-all
    mv nextflow-20.04.0-edge-al nextflowl
