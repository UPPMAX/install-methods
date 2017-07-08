tophat/2.1.1
============

LOG
---

Install precompiled version.

    cd /sw/apps/bioinfo/tophat
    VERSION=2.1.1
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    wget https://ccb.jhu.edu/software/tophat/downloads/tophat-${VERSION}.Linux_x86_64.tar.gz
    tar xvzf tophat-${VERSION}.Linux_x86_64.tar.gz 
    cp -av tophat-${VERSION}.Linux_x86_64 $PFX/bin
    cd $PFX/..
    ln -s ./milou rackham
    ln -s ./milou bianca
    ln -s ./milou irma

Also installed bowtie2/2.3.2 and bowtie/1.2.0 and in the mf file, prefer to use
them with this tophat.
