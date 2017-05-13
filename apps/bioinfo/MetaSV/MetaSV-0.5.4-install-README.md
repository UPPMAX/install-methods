MetaSV/0.5.4
============

An accurate and integrative structural-variant caller for next generation sequencing.

<http://bioinform.github.io/metasv/>
<https://github.com/bioinform/metasv>

LOG
---

Needs python, AGE, SPAdes, BEDTools.  Installed as prerequisites AGE/0.4,
spades/3.10.1.  The most recent version of SPAdes was not necessary but a good
excuse to do it anyway.  Note the AGE/0.4 executable without OMP support is what
is required for this tool.

    cd /sw/apps/bioinfo
    mkdir MetaSV
    cd MetaSV
    VERSION=0.5.4
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir src_$CLUSTER $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    module load BEDTools/2.26.0
    module load spades/3.10.1
    module load AGE/0.4
    module load python/2.7.6
    PYTHONUSERBASE=$PFX pip install --user https://github.com/bioinform/metasv/archive/${VERSION}.tar.gz

When building on rackham, symlinks for bianca and irma.

Use mf file from eLSA installed, load the above modules plus set PYTHONPATH.


