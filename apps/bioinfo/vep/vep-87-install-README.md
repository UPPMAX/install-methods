# vep-87-install-README.md

vep/87
======

First of all, there was a bug building the local caches for vep/87.  I reported
it to Ensemble (their ticket #175756) and Will McLaren responded that it was a
bug in the `convert_cache.pl` script.  I confirmed that the new zip contains
the fix so we're reinstalling from scratch here.

    VERSION=87
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/vep
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION mf
    VERSIONDIR=$TOOL/$VERSION
    cd $VERSIONDIR
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
    1. added /sw/apps/bioinfo/vep/87/milou to your PERL5LIB environment variable?
    2. added /sw/apps/bioinfo/vep/87/milou/htslib to your PATH environment variable?
    (y/n)

The two `export` lines above do that, so answer `y`.

It will install BioPerl and htslib and maybe a few other things for itself as
parts of the Ensembl API for VEP only.  Seems to want its own versions, so just
let it continue.  It will also run some tests, which is nice.

It will later ask if you want to install cache files, answer `y`, and then `0`
to install all choices.  This part takes a long time.

Copy over the scripts.

    cd $VERSIONDIR/src/ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
    mkdir $CLUSTERDIR/scripts
    rsync -rPlt * $CLUSTERDIR/scripts/

Ensure all can find the proper perl and "deactiveate" the install script.

    cd $CLUSTERDIR/scripts
    vi gtf2vep.pl  # change to #!/usr/bin/env perl
    chmod -x INSTALL.pl


