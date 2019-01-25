# GARM-0.7-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

GARM 0.7


DESCRIPTION
-----------

Genome assembly merger


WEBSITE
-------

    http://garm-meta-assem.sourceforge.net/


MODULE REQUIREMENTS
-------------------

GARM requires several tools and some Perl packages.  GARM was straightforward
to set up, but its prerequisite AMOS was a bit more complicated.

From the README.txt:

    REQUIREMENTS:
    -Perl v5.8 or above
    -Perl Modules:
        Parallel::ForkManager
        List::MoreUtils
    The best way to install a perl module would be CPAN
    -AMOS (tested on v3.0.0) software (http://sourceforge.net/apps/mediawiki/amos/index.php?title=AMOS)
    -MUMmer (tested on v3.22) software (nucmer) (http://mummer.sourceforge.net/)
    -R language (for GC plots only)


LOG
===

Following the install for a module system as described in the package README.txt:

    TOOL=/sw/apps/bioinfo/GARM
    VERSION=0.7
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION/src
    wget http://sourceforge.net/projects/garm-meta-assem/files/GARM_v0.7.tar.gz/download
    mv download GARM_v0.7.tar.gz
    tar xvzf GARM_v0.7.tar.gz 
    CLUSTER=milou
    mkdir -p ../$CLUSTER
    cd GARM
    cp -av * ../../$CLUSTER
    cd ../../$CLUSTER

Install Perl packages required following https://www.uppmax.uu.se/faq/installing-local-perl-packages.

    export GARM_PERL=$TOOL/$VERSION/$CLUSTER/perl-packages
    wget -O- http://cpanmin.us | perl - -l $GARM_PERL App::cpanminus local::lib

This will install several prerequisites if you have properly cleaned out your environment.

    cp ../../../AMOS/3.0.0/AMOS_perl_profile GARM_perl_profile

Edit AMOS_PERL to be GARM_PERL and have the above directory for GARM_PERL.

    source GARM_perl_profile
    cpanm List::MoreUtils
    cpanm Parallel::ForkManager


The mf file
-----------

The mf file needs

    module load AMOS/3.0.0
    module load MUMmer/3.22

That last is redundant since AMOS already loads it.  The mf file also needs to set
several variables for its environment.  PATH and PERL5LIB are expected, but the
others are GARM-specific and specified as required in its README.txt.

    prepend-path    PATH               $modroot
    prepend-path    PERL5LIB           $modroot/perl-packages/lib/perl5

    setenv          GARMBIN            $modroot/bin
    setenv          GARMLIB            $modroot/lib
    setenv          MUMBIN             /sw/apps/bioinfo/MUMmer/3.22/milou
    setenv          AMOSBIN            /sw/apps/bioinfo/AMOS/3.0.0/milou/bin

