MultiQC/1.0
===========

<http://multiqc.info/>

LOG
---

Simple to install with `pip`.

    VERSION=1.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd MultiQC/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/2.7.6
    PYTHONUSERBASE=$PFX pip install --user multiqc

