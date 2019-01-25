# vep-84-install-README.md

vep/84
======

    TOOL=/sw/apps/bioinfo/vep
    mkdir -p $TOOL
    cd $TOOL
    VERSION=84
    mkdir -p $VERSION mf
    VERSIONDIR=$TOOL/$VERSION
    cd $VERSIONDIR
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTER src
    cd src
    wget https://github.com/Ensembl/ensembl-tools/archive/release/${VERSION}.zip
    unzip ${VERSION}.zip 
    cd ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/

No need to install `DBD::mysql` within `perl_modules/5.18.4` since this was
already done for `vep/82`.

Now back to vep.  Create the cache directory.

    CACHEDIR=/sw/data/uppnex/vep/${VERSION}
    mkdir -p $CACHEDIR
    module load perl/5.18.4
    module load perl_modules/5.18.4
    export PATH=$CLUSTERDIR/htslib:$PATH
    export PERL5LIB=$CLUSTERDIR:$PERL5LIB
    ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR

NOTE: running the INSTALL.pl script will generate a question:

    Have you
    1. added /sw/apps/bioinfo/vep/84/milou to your PERL5LIB environment variable?
    2. added /sw/apps/bioinfo/vep/84/milou/htslib to your PATH environment variable?
    (y/n)

The two `export` lines above do that, so answer `y`.

It will later ask if you want to install cache files, answer `y`, and then `0`
to install all choices.  This part takes a long time.

"Deactiveate" the install script.

    cd $CLUSTERDIR/scripts
    chmod -x INSTALL.pl
