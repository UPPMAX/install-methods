MultiQC/1.5
===========

<http://multiqc.info/>

LOG
---

Simple to install with `pip`.

    VERSION=1.5
    PYTHONVERSION=2.7.11
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd MultiQC/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC ; done
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user multiqc==$VERSION

