Nextflow/20.02.0-edge
========================

<https://github.com/nextflow-io/nextflow>

Used under license:
Apache 2.0

Structure creating script (makeroom_Nextflow_20.02.0-edge.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Nextflow/makeroom_20.02.0-edge.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "Nextflow" -v "20.02.0-edge" -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Apache 2.0" -f"
    ./makeroom_Nextflow_20.02.0-edge.sh
    cd $PREFIX
    curl -fsSL https://get.nextflow.io | bash

Make the modulefile and load it, then run nextflow to get everything installed.

    ml Nextflow
    nextflow
