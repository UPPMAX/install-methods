sambamba/0.6.6
==============

Fast BAM file processing.

<http://lomereiter.github.io/sambamba/>

LOG
---

Download precompiled linux 64-bit, and add versionless symlink.

    VERSION=0.6.6
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/sambamba
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    wget https://github.com/lomereiter/sambamba/releases/download/v${VERSION}/sambamba_v${VERSION}_linux.tar.bz2
    tar xjvf sambamba_v${VERSION}_linux.tar.bz2
    mv sambamba_v${VERSION} $PFX/
    cd $PFX
    ln -s sambamba_v${VERSION} sambamba
    cd ..
    for S in rackham irma bianca ; do ln -s milou $S; done

The mf file is just like previous version, just add `$modroot` to `PATH`.
