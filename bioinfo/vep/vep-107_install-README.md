vep/107
========================

<https://github.com/Ensembl/ensembl-vep>

Used under license:
Apache 2.0


Structure creating script (makeroom_vep_107.sh) moved to /sw/bioinfo/vep/makeroom_107.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "vep" "-v" "107" "-l" "Apache 2.0" "-w" "https://github.com/Ensembl/ensembl-vep" "-s" "misc" "-f"
    ./makeroom_vep_107.sh
    TOOL='vep'
    VERSION='107'

# Clone repo and checkout v107
    cd $SRCDIR
    git clone https://github.com/Ensembl/ensembl-vep.git
    cd ensembl-vep
    git checkout release/107.0

# Load modules
    module load perl/2.26.2
    module load perl_modules/5.26.2

# Add data cache dir on /sw/data/
    CACHEDIR=/sw/data/$TOOL/$VERSION
    mkdir -p $CACHEDIR

# Export paths, otherwise the install fails
    export PATH=$PREFIX/htslib:$PATH
    export PERL5LIB=$PREFIX:$PERL5LIB

# Install and answer yes to the questions. Also accept the local database install.
    perl INSTALL.pl -d $PREFIX -t -c $CACHEDIR

# Many questions are asked during the install. Say yes to all. 
# After downloading the local cache files the error "ERROR: For technical reasons this installer is unable to install GRCh37 caches alongside others; please install them separate" appears. 
# The installer downloads the 3 homo_sapiens GRCh37 and it seems OK. I will continue. 

# Copy scripts to $PREFIX
    mkdir -p $PREFIX/scripts
    cp -av * $PREFIX/scripts/
    cd $PREFIX/scripts/
    rm -rf t

# Replace /usr/bin/perl with /usr/bin/env perl
    cd $PREFIX
    sed -r -i.bak 's/\#\!\/usr\/bin\/perl.*$/\#\!\/usr\/bin\/env perl/' $(grep -rl --include=*.pl \#\!/usr/bin/perl)
    

# Test with
    cd $SRCDIR/ensembl-vep
    vep -i examples/homo_sapiens_GRCh38.vcf --cache --dir $VEP_CACHE --force_overwrite  --assembly GRCh38











vep/99
========================

<https://github.com/Ensembl/ensembl-vep>

Used under license:
Apache 2.0

Structure creating script (makeroom_vep_99.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/vep/makeroom_99.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "vep" -v "99" -w "https://github.com/Ensembl/ensembl-vep" -d "Variant Effect Predictor predicts the functional effects of genomic variants." -l "Apache 2.0" -f"

LOG
---

    screen -R vep
    /home/jonass/uppmax/install-methods/makeroom.sh -t "vep" -v "99" -w "https://github.com/Ensembl/ensembl-vep" -d "Variant Effect Predictor predicts the functional effects of genomic variants." -l "Apache 2.0" -f"
    ./makeroom_vep_99.sh
    cd $VERSIONDIR/src
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

I did not follow the next instruction:
##If on rackham, answer `n` to all cache installation questions.

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

