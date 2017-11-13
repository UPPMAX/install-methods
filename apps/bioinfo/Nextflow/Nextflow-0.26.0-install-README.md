Nextflow/0.26.0
===============

Data pipeline tool

<https://www.nextflow.io/>

LOG
---

    VERSION=0.26.0
    TOOL=/sw/apps/bioinfo/Nextflow
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    CC=rackham
    mkdir $CC
    for C in milou irma bianca ; do rm -f $C && ln -s $CC $C; done
    cd $CC
    PFX=$PWD

During installation, set `NXF_HOME` to a subdirectory of the installation
directory so that the Java jars get installed to a within-module location.

    mkdir nxf_home
    export NXF_HOME=$PFX/nxf_home

    curl -fsSL get.nextflow.io | bash

Unfortunately this has the side effect of attempting to install the launchers
there as well, in `$NXF_HOME/tmp`.  I submitted a pull request, and the
developer modified a function so that if `NXF_TEMP` is set, then `nextflow`
will use that for temporary files.  Users should also set `NXF_LAUNCHER` to
avoid a warning message as well; this can be set to the same place.  The mf
file produces a message to that effect.
