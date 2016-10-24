GenomeSTRiP 2.00.1685
=====================

Structural variant pipeline

<http://software.broadinstitute.org/software/genomestrip/index.html>

LOG
---

    cd /sw/apps/bioinfo/
    GenomeSTRiP/
    VERSION=2.00.1685
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd src

GenomeSTRiP needs to be downloaded by a registered user, so rsync from my comp to src.

    tar xzf svtoolkit_2.00.1685.tar.gz 
    mv svtoolkit ../$CLUSTER/

Use the mf from 2.00.1650.

