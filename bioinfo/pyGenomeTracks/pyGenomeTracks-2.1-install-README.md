pyGenomeTracks/2.1
===========

<http://multiqc.info/>

LOG
---

Simple to install with `pip`.

    VERSION=2.1
    PYTHONVERSION=2.7.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd pyGenomeTracks/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL ; done
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user pyGenomeTracks==$VERSION

