MultiQC/1.8
===========

<http://multiqc.info/>

LOG
---

Simple to install with `pip`.

    VERSION=1.8
    PYTHONVERSION=3.6.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/
    cd MultiQC/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CL in snowy bianca irma ; do test -L $CL || ln -s $CLUSTER $CL ; done
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user multiqc==$VERSION

