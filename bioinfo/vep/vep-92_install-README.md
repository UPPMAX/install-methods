vep/92
========================

<http://>

LOG
---

I did..

    TOOL=vep
    VERSION=92
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/vep/makeroom_92.sh

    ./makeroom_vep_92.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION
    mkdir -p src_$CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    cd src_$CLUSTER
    module load git/2.16.1
    git clone https://github.com/Ensembl/ensembl-vep.git
    cd ensembl-vep
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load htslib/1.8
    CACHEDIR=/sw/data/uppnex/$TOOL/$VERSION
    mkdir -p $CACHEDIR
    PFX=$VERSIONDIR/$CLUSTER
    export PATH=$PFX/htslib:$PATH
    export PERL5LIB=$PFX:$PERL5LIB
    ./INSTALL.pl -d $PFX -t -c $CACHEDIR

NOTE: running the INSTALL.pl script will generate a question:

    Have you
    1. added /sw/apps/bioinfo/vep/87/milou to your PERL5LIB environment variable?
    2. added /sw/apps/bioinfo/vep/87/milou/htslib to your PATH environment variable?
    (y/n)

The two `export` lines above do that, so answer `y`.

If on rackham, answer `n` to all cache installation questions.

Copy over the scripts.  This copies over the whole git tree, which is fine.  It
then removes the large test subdirectory.  Ensure all can find the proper perl
via `#!/usr/bin/env perl` line to  and (unlike earlier VEP versions) do not
deactiveate the install script so users can install their own to their own
project directories.

    mkdir -p $PFX/scripts
    cp -av * $PFX/scripts/
    cd $PFX/scripts/
    rm -rf t
    head -n 1 *.pl filter_vep haplo variant_recoder vep

