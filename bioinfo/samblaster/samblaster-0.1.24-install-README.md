samblaster 0.1.24
=================

<https://github.com/GregoryFaust/samblaster>

LOG
---

Very straightforward.

    VERSION=0.1.24
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/samblaster
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd src
    wget https://github.com/GregoryFaust/samblaster/releases/download/v.${VERSION}/samblaster-v.${VERSION}.tar.gz
    tar xvzf samblaster-v.${VERSION}.tar.gz 
    cd samblaster-v.${VERSION}
    module load gcc/5.4.0
    make
    cp samblaster ../../$CLUSTER
    make clean

Link bianca and irma to rackham, and recompile for milou.
