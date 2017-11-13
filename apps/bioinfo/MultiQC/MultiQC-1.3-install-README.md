MultiQC/1.3
===========

<http://multiqc.info/>

LOG
---

Simple to install with `pip`.

    VERSION=1.3
    PYTHONVERSION=2.7.11
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd MultiQC/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user multiqc

