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
    VERSION=3.1.0
    CLUSTER=${CLUSTER:?CLUSTER must bs set}
    mkdir /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER
    PFX=$PWD

    module load python/2.7.15

    PYTHONUSERBASE=$PFX pip install --user $TOOL

