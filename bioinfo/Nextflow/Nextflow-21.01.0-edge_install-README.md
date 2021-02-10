Nextflow/21.01.0-edge
========================

<https://github.com/nextflow-io/nextflow>

Used under license:
Creative Commons Attribution-ShareAlike 4.0 International Public License
<https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>

Structure creating script (makeroom_Nextflow_21.01.0-edge.sh) moved to /sw/bioinfo/Nextflow/makeroom_21.01.0-edge.sh

LOG
---

    TOOL=Nextflow
    VERSION=21.01.0-edge
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Nextflow/21.01.0-edge/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "Nextflow" -v "21.01.0-edge" -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f"
    ./makeroom_Nextflow_21.01.0-edge.sh
    cd $SRCDIR 
    wget https://github.com/nextflow-io/nextflow/releases/download/v21.01.0-edge/nextflow-21.01.0-edge-all
    chmod +x nextflow-21.01.0-edge-all
    cp nextflow-21.01.0-edge-all ../rackham/nextflow
