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
    mkdir -p $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
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

It will later ask if you want to install cache files, fasta files, and others.
On milou, answer `y`, and then `0` to install all choices.  This part takes a
long time.  If there is an error/message during cache installation (the first
step), then it will not ask to install Fasta or plugins; if this happens, then
rerun the INSTALL script, saying `n` to the cache installation but `y` to the
rest.  FASTA will probably not be installed (because of the cache installation)
and install plugins, but not data.  That will be up to the users of the
plugins.  One uses ExAC, which we do have as a database.

If on rackham, answer `n` to all cache installation questions.

Copy over the scripts.

    cd $VERSIONDIR/src_$CLUSTER/ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
    mkdir $CLUSTERDIR/scripts
    rsync -rPlt * $CLUSTERDIR/scripts/

Ensure all can find the proper perl via `#!/usr/bin/env perl` line to  and (unlike earlier VEP versions) do not deactiveate the install script so users can install their own to their own project directories.

    cd $CLUSTERDIR/scripts
    vi *.pl


