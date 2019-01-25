bwa/0.7.17
==========

<https://github.com/lh3/bwa/releases/tag/v0.7.17>


Log
---

    TOOL=/sw/apps/bioinfo/bwa
    VERSION=0.7.17
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    mkdir -p bin man/man1
    cd ../src
    [[ -f bwa-${VERSION}.tar.bz2 ]] || wget https://github.com/lh3/bwa/releases/download/v${VERSION}/bwa-${VERSION}.tar.bz2
    tar xjf bwa-${VERSION}.tar.bz2 
    cd bwa-$VERSION
    module load gcc/6.3.0
    module load zlib/1.2.11
    make
    cp bwa *.pl $PFX/bin/
    cp bwa.1 $PFX/man/man1
    cd ..
    rm -rf bwa-$VERSION


Repeat build and copy for rackham.
