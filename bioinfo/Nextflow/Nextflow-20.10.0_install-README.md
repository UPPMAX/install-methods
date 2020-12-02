Nextflow/20.10.0
========================

<https://github.com/nextflow-io/nextflow>

Used under license:
Creative Commons Attribution-ShareAlike 4.0 International Public License
<https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt>

Structure creating script (makeroom_Nextflow_20.10.0.sh) moved to /sw/bioinfo/Nextflow/makeroom_20.10.0.sh

LOG
---

    TOOL=Nextflow
    VERSION=20.10.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Nextflow/20.10.0/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "Nextflow" -v "20.10.0" -d "A DSL for data-driven computational pipelines http://nextflow.io" -w "https://github.com/nextflow-io/nextflow" -l "Creative Commons Attribution-ShareAlike 4.0 International Public License" -L "https://github.com/nextflow-io/nextflow/blob/master/docs/LICENCE.txt" -f"
    ./makeroom_Nextflow_20.10.0.sh
    cd $SCRDIR
    wget -qO- https://get.nextflow.io | bash
    mv nextflow $PREFIX/
