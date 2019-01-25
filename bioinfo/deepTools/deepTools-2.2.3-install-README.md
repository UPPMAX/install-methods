deepTools 2.2.3
===============

<https://deeptools.github.io/>

<https://github.com/fidelram/deepTools>


To facilitate installing on both tintin and milou, I switched to the older
python/2.7.6 module for this install.  This resulted in scipy being out of date
and being built/installed specifically for deepTools, so the pip command below
is easy to issue but takes a while to complete.


Log
---

    TOOLDIR=/sw/apps/bioinfo/deepTools
    VERSION=2.2.3
    CLUSTER=milou
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    mkdir -p mf
    VERSIONDIR=$TOOLDIR/$VERSION
    cd $VERSIONDIR
    mkdir -p $CLUSTER
    CLUSTERDIR=$VERSIONDIR/$CLUSTER

Install using pip (yippee!).  The deepTools-1.5.11-install-README.md file shows an
older method, this is much easier.  Note we need $CLUSTERDIR set correctly.

    module load python/2.7.6
    module load gcc/4.9.2
    module load libcurl/7.45.0
    cd $CLUSTERDIR
    PYTHONUSERBASE=$CLUSTERDIR pip install deeptools --user

While the above is running, make sure it is installing the version you mean
(here, 2.2.3).

Simplify the mf from 2.0.1 to remove loading samtools and ucsc-utilities.  I am
hoping this is rolled into the rest of the package now.

