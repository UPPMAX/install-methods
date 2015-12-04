# GARM-0.7.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

GARM 0.7.3


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

That Perl version requirement is not correct.  The Perl modules required will
not build without a later perl, so we will load the one we have available, 5.18.2.


LOG
===

Following the install for a module system as described in the package README.txt:

    module load perl/5.18.2

    TOOL=/sw/apps/bioinfo/GARM
    VERSION=0.7.3
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION/src
    wget http://sourceforge.net/projects/garm-meta-assem/files/GARM_v0.7.3.tar.gz
    tar xvzf GARM_v0.7.3.tar.gz 
    CLUSTER=milou
    mkdir -p ../$CLUSTER
    cd GARM_v0.7.3
    cp -av * ../../$CLUSTER
    cd ../../$CLUSTER

Install Perl packages required following https://www.uppmax.uu.se/faq/installing-local-perl-packages.

    cp ../../0.7/$CLUSTER/GARM_perl_profile .

Edit GARM_PERL to point to 0.7.3 and have the above directory for GARM_PERL.

Now install several prerequisites if you have properly cleaned out your environment.

    export GARM_PERL=$TOOL/$VERSION/$CLUSTER/perl-packages
    mkdir -p $GARM_PERL
    wget -O- http://cpanmin.us | perl - -l $GARM_PERL App::cpanminus local::lib

    source GARM_perl_profile
    cpanm List::MoreUtils
    cpanm Parallel::ForkManager

The previous version loaded modules for AMOS/3.0.0 and MUMmer/3.22, but now GARM
includes trees for those.  I think I should continue to use the local modules,
because the README.txt gives no indication that these are in any way special...
I hope not!  Plus, running the executables for MUMmer gives:

    milou-b: /sw/apps/bioinfo/GARM/0.7.3/milou/MUMmer3.22 $ ./show-coords
    ./show-coords: /lib64/libc.so.6: version 'GLIBC_2.14' not found (required by ./show-coords)



The mf file
-----------

The mf file needs

    module load perl/5.18.2
    module load AMOS/3.0.0
    module load MUMmer/3.23

That last is redundant since AMOS already loads it.  The mf file also needs to set
several variables for its environment.  PATH and PERL5LIB are expected, but the
others are GARM-specific and specified as required in its README.txt.

    prepend-path    PATH               $modroot
    prepend-path    PERL5LIB           $modroot/perl-packages/lib/perl5

    setenv          GARMBIN            $modroot/bin
    setenv          GARMLIB            $modroot/lib
    setenv          MUMBIN             /sw/apps/bioinfo/MUMmer/3.22/$Cluster
    setenv          AMOSBIN            /sw/apps/bioinfo/AMOS/3.0.0/$Cluster/bin
    setenv          AMOSLIB            /sw/apps/bioinfo/AMOS/3.0.0/$Cluster/lib

Of course make sure there are cluster-specific versions of MUMmer and AMOS.


