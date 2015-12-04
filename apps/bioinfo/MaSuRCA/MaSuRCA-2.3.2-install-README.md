# MaSuRCA-2.3.2-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    MaSuRCA assembler 2.3.2

DESCRIPTION
-----------

    WGS assembler for varied DNA sequence data

    Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013). 
    doi:10.1093/bioinformatics/btt476

WEBSITE
-------

    http://www.genome.umd.edu/masurca.html

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/MaSuRCA/2.3.2/$Cluster/bin to PATH

LOG
===

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=2.3.2
    CLUSTER=milou
    mkdir -p $TOOL/$VERSION/$CLUSTER
    TOOLDIR=$TOOL/$VERSION
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER

    cd $TOOLDIR
    mkdir milou tintin
    ln -s ./milou nestor
    ln -s ./milou halvan
    mkdir src
    SOURCEDIR=$TOOL/$VERSION/src
    cd $SOURCEDIR

Now transfer MaSuRCA-2.3.2.tar.gz here.  You have to provide an email address at the website (<http://www.genome.umd.edu/masurca_form.html>) and then you get a link to download it.  The link I received is <http://www.genome.umd.edu/download_masurca.php?a=ZG91Z2xhcy5zY29maWVsZEBlYmMudXUuc2U&b=src&c=39598913&d=74e6f2c9e53785d6a7dbb599718174ebf11bbba9>.

    rm -rf MaSuRCA-2.3.2
    tar xzf MaSuRCA-2.3.2.tar.gz
    cd MaSuRCA-2.3.2

    module load perl/5.18.2
    module load gcc/4.8.3

    DEST=$CLUSTERDIR ./install.sh

Lots of building, and now it looks like it sets up LD_RUN_DIR properly for the executables so we do not need to set LD_LIBRARY_PATH.  I hope so, anyway.
    
Now install the perl module (Statistics::Descriptive) it requires.

    cd $CLUSTERDIR
    mkdir perl-packages
    
    export MASURCA_PERL=$CLUSTERDIR/perl-packages
    mkdir -p $MASURCA_PERL
    wget -O- http://cpanmin.us | perl - -l $MASURCA_PERL App::cpanminus local::lib

Create MASURCA_perl_profile:

    echo 'export MASURCA_PERL=/sw/apps/bioinfo/MaSuRCA/2.3.2/milou/perl-packages' > MASURCA_perl_profile
    echo 'eval `perl -I $MASURCA_PERL/lib/perl5 -Mlocal::lib=$MASURCA_PERL`' >> MASURCA_perl_profile
    echo 'export PATH=$MASURCA_PERL/bin/:$PATH' >> MASURCA_perl_profile

Now to complete the perl package installation, force its local installation even if there is a version available on the system.  This is safer.

    source MASURCA_perl_profile
    cpanm --force Statistics::Descriptive


The mf file
-----------

The mf file needs

    module load perl/5.18.2
    
I do not think it needs gcc/4.8.3 even though we built with that.  I will test.

    prepend-path    PATH               $modroot/bin
    prepend-path    PERL5LIB           $modroot/perl-packages/lib/perl5

