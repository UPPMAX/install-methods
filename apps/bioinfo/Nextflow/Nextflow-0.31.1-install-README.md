Nextflow/0.26.0
===============

Data pipeline tool

# <https://www.nextflow.io/>

LOG
---

    VERSION=0.31.1
    TOOL=/sw/apps/bioinfo/Nextflow
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    CC=rackham
    mkdir $CC
    for C in milou irma bianca; do
      ln -s $CC $C; done
    cd $CC
    PFX=$PWD

During installation, set `NXF_HOME` to a subdirectory of the installation
directory so that the Java jars get installed to a within-module location.

    mkdir nxf_home
    export NXF_HOME=$PFX/nxf_home
    export NXF_LAUNCHER=$SNIC_TMP
    export NXF_TEMP=$SNIC_TMP
    curl -fsSL get.nextflow.io | bash
    chmod a+rx nextflow $PFX/nxf_home/framework/$VERSION/*.jar
