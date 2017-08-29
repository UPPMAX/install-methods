kallisto/0.43.1
===============

Quantifying abundances of transcripts from RNA-Seq data.

<http://pachterlab.github.io/kallisto/>

Install on milou.  Switch from source build for 0.43.0 to prebuilt for this version.

    VERSION=0.43.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/kallisto
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER/bin src
    cd $CLUSTER/bin
    PFX=$PWD
    cd ../../src
    [[ -f kallisto_linux-v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/releases/download/v${VERSION}/kallisto_linux-v${VERSION}.tar.gz
    tar xzf kallisto_linux-v${VERSION}.tar.gz 
    cd kallisto_linux-v${VERSION}
    cp -av kallisto $PFX/

Create symlinks for the other clusters.  On milou:

    cd $PFX/../..
    ln -s milou rackham
    ln -s milou bianca
    ln -s milou irma

Reuse the previous mf.

