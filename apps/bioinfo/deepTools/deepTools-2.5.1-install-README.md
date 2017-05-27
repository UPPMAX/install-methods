# deepTools-2.5.1-install-README.md

deepTools
=========

Useful tools for exploring deep sequencing data
<https://github.com/fidelram/deepTools>

installation
------------

Installed via Python's pip. Using latest installed pysam
rather than letting pip grab its own copy. Note that the
PYTHONPATH was prepended rather than overwritten.

Updated to latest pysam for the sake of Rackham so using
a newer gcc as well. Assuming Milou is the only cluster 
running an old enough OS that a separate libcurl is needed.

    TOOL=deepTools
    VERS=2.5.1

    module load python/2.7.6
    module load gcc/5.4.0
    [[ $CLUSTER = milou ]] && module load libcurl/7.45.0
    module load bioinfo-tools
    module load pysam/0.10.0

    APPS=/sw/apps/bioinfo
    INST=$APPS/$TOOL/$VERS/$CLUSTER
    echo $INST # sanity check

    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages:$PYTHONPATH
    pip install --install-option="--prefix=$INST" $TOOL==$VERS


