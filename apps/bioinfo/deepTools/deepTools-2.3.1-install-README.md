# deepTools-2.3.1-install-README.md

deepTools
=========

Useful tools for exploring deep sequencing data
<https://github.com/fidelram/deepTools>

installation
------------

Installed via Python's pip. Using latest installed pysam
rather than letting pip grab its own copy. Note that the
PYTHONPATH was prepended rather than overwritten.

    TOOL=deepTools
    VERS=2.3.1

    module load python/2.7.6
    module load gcc/4.9.2
    module load libcurl/7.45.0
    module load bioinfo-tools
    module load pysam/0.9.1.4

    APPS=/sw/apps/bioinfo
    INST=$APPS/$TOOL/$VERS/$CLUSTER
    echo $INST # sanity check

    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages:$PYTHONPATH
    pip install --install-option="--prefix=$INST" $TOOL

---
wesleys  
2016-07-24
