BEDOPS/2.4.28
=============

BEDOPS high-performance genomic feature operations

<https://bedops.readthedocs.io/en/latest/>

LOG
---

Just download Linux x86_64 binaries.

    VERSION=2.4.28
    THISCLUSTER=milou
    TOOLDIR=/sw/apps/bioinfo/BEDOPS
    VDIR=$TOOLDIR/$VERSION
    mkdir -p $VDIR
    cd $VDIR
    mkdir $CLUSTER src
    cd src
    wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
    tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
    mv bin ../$THISCLUSTER/
    cd ..
    ln -s $THISCLUSTER rackham
    ln -s $THISCLUSTER bianca
    ln -s $THISCLUSTER irma

