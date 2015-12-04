# SVDetect-0.8b-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    SVDetect 0.8b

DESCRIPTION
-----------

    SVDetect 0.8b

WEBSITE
-------

    http://svdetect.sourceforge.net/Site/Home.html

MODULE REQUIREMENTS
-------------------

SVDetect has two executable directories as well as some Perl modules.

LOG
---

    TOOL=/sw/apps/bioinfo/SVDetect
    VERSION=0.8b
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    wget http://downloads.sourceforge.net/project/svdetect/SVDetect/0.80/SVDetect_r0.8b.tar.gz
    tar xvzf SVDetect_r0.8b.tar.gz 

Install Perl modules

    cd $CLUSTERDIR
    export MY_PERL=$PWD/perl
    mkdir perl
    wget -O- http://cpanmin.us | perl - -l $MY_PERL App::cpanminus local::lib
    echo "eval `perl -I $MY_PERL/lib/perl5 -Mlocal::lib=$MY_PERL`" > source-for-perl-setup
    echo "eval `perl -I $MY_PERL/lib/perl5 -Mlocal::lib=$MY_PERL`" >> source-for-perl-setup 
    source source-for-perl-setup 
    cpanm Config::General
    cpanm Tie::IxHash
    cpanm Parallel::ForkManager
    cd ../src/SVDetect_r0.8b

Now replace #!/usr/bin/perl with #!/usr/bin/env perl

    vi bin/SVDetect scripts/BAM_preprocessingPairs.pl 

Copy things over, ignore lib/ since it holds copies of two Perl modules
we have already installed ourselves.

    cp -av bin README scripts test_sample $CLUSTERDIR/

For the mf, add

    module load perl/5.18.2
    # main
    prepend-path    PATH            $modroot/bin
    # for script
    prepend-path    PATH            $modroot/scripts
    prepend-path    PERL5LIB    $modroot/perl/lib/perl5


