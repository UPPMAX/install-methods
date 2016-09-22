Strelka 1.0.15
==============

<https://sites.google.com/site/strelkasomaticvariantcaller/home>

LOG
---

    cd /sw/apps/bioinfo/
    mkdir strelka
    cd strelka
    VERSION=1.0.15
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $VERSION
    cd $VERSION
    [[ ! -d $CLUSTER ]] || rm -rf $CLUSTER
    mkdir $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ..
    [[ ! -d src_$CLUSTER ]] || rm -rf src_$CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget ftp://strelka:%27%27@ftp.illumina.com/v1-branch/v${VERSION}/strelka_workflow-${VERSION}.tar.gz
    tar xzf strelka_workflow-${VERSION}.tar.gz 
    cd strelka_workflow-${VERSION}/

This builds well with the default tools on CentOS 6.7.  It should be allowed to build its own boost subset, and use the older zlib, and the system gcc.

    ./configure --prefix=$P
    make

For the mf, this package is a bit odd, in that it expects to get path
information from the invocation of the main script.  The README instructions
are clear about this, so we set `STRELKA_INSTALL_DIR` in the mf and let the user
use that method for invoking the pipeline.  We do not update `PATH`.
