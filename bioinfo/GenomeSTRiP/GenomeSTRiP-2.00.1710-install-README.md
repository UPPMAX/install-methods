GenomeSTRiP 2.00.1710
=====================

Structural variant pipeline

<http://software.broadinstitute.org/software/genomestrip/index.html>

LOG
---

    cd /sw/apps/bioinfo/
    mkdir -p GenomeSTRiP
    cd GenomeSTRiP
    VERSION=2.00.1710
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd src

GenomeSTRiP needs to be downloaded by a registered user, so rsync from my comp to src.

    tar xzf svtoolkit_2.00.1710.tar.gz 
    mv svtoolkit ../$CLUSTER/

Use the mf from 2.00.1650.

