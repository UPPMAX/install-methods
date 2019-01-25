Corset 1.04
===========

<https://github.com/Oshlack/Corset/wiki>

Log
---

    TOOLDIR=/sw/apps/bioinfo/Corset
    VERSION=1.04
    VERSIONDIR=$TOOLDIR/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER

    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    module load gcc/4.9.2
    cd src
    wget https://github.com/Oshlack/Corset/archive/version-${VERSION}.tar.gz
    tar xzf version-${VERSION}.tar.gz 
    wget https://github.com/samtools/samtools/releases/download/1.1/samtools-1.1.tar.bz2
    tar xjf samtools-1.1.tar.bz2 
    cd samtools-1.1/
    SAMTOOLSDIR=$PWD
    make
    cd ..
    cd Corset-version-${VERSION}/
    ./configure --prefix=$CLUSTERDIR --with-bam_inc=$SAMTOOLSDIR --with-bam_lib=$SAMTOOLSDIR
    make
    make install

Build for tintin as well.

Standard mf, just add $CLUSTERDIR/bin to PATH.

