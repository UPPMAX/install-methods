HISAT2 2.1.0
=================

Graph-based alignment of next generation sequencing reads to a population of genomes

<http://ccb.jhu.edu/software/hisat2/index.shtml>

Log
---

    TOOLDIR=/sw/apps/bioinfo/HISAT2
    VERSION=2.1.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-${VERSION}-source.zip
    unzip hisat2-${VERSION}-source.zip 
    cd hisat2-${VERSION}/
    view MANUAL

Note several executables to copy over.  I am also copying over some top-level
Python scripts and the `scripts/` directory as released.

    module load gcc/6.2.0
    make

Copy over the executables and scripts.

    cp -v hisat2 hisat2-align-? hisat2-build hisat2-build-? hisat2-inspect hisat2-inspect-? $CLUSTERDIR/
    cp -rv *.py scripts $CLUSTERDIR/

Do the same for tintin.

For the mf file, add `$modroot` and `$modroot/scripts`.

