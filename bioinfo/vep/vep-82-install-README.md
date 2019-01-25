# vep-82-install-README.md

vep/82
======

    TOOL=/sw/apps/bioinfo/vep
    mkdir -p $TOOL
    cd $TOOL
    VERSION=82
    mkdir -p $VERSION mf
    VERSIONDIR=$TOOL/$VERSION
    cd $VERSIONDIR
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTER src
    cd src
    wget https://github.com/Ensembl/ensembl-tools/archive/release/82.zip
    unzip 82.zip 
    cd ensembl-tools-release-82/scripts/variant_effect_predictor/

Had to install the DBD::mysql module on perl_modules/5.18.4.  Do it in a screen
to avoid messing up the environment with the 'source'.

    screen -S perl_modules
    cd /sw/comp/perl_modules/5.18.4/milou/
    source source-for-milou-perl_module-deps-setup 
    cpanm DBD::mysql
    exit
  
Now back to vep.  Create the cache directory.

    CACHEDIR=/sw/data/uppnex/vep/82
    mkdir -p $CACHEDIR
    module load perl/5.18.4
    module load perl_modules/5.18.4
    export PATH=$CLUSTERDIR/htslib:$PATH
    export PERL5LIB=$CLUSTERDIR:$PERL5LIB
    ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR

"Deactiveate" the install script.

    cd $CLUSTERDIR/scripts
    mv INSTALL.pl _INSTALL.pl
