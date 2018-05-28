maker/2.28
==========

Wes's original notes, perhaps.


    https://www.uppmax.uu.se/faq/installing-local-perl-packages
    export MY_PERL=/sw/apps/bioinfo/maker/2.28/perl
    wget -O- http://cpanmin.us | perl - -l $MY_PERL App::cpanminus local::lib
    echo 'eval `perl -I $MY_PERL/lib/perl5 -Mlocal::lib=$MY_PERL`' >> perlrc
    echo 'export PATH=$MY_PERL/bin/:$PATH' >> perlrc 
    source perlrc 
    cpanm DBD::SQLite
    cpanm IO::Prompt
    cpanm File::Which
    cpanm Perl::Unsafe::Signals
    cpanm Bit::Vector
    cpanm Inline::C

    ##export WUBLASTFILTER="/usr/local/wublast/filter"
    ##export WUBLASTMAT="/usr/local/wublast/matrix"
    ##export PERL5LIB="/usr/local/bioperl-live:$PERL5LIB
    ##md blast/2.2.28+ augustus exonerate snap RepeatMasker
    Currently Loaded Modules:
      1) uppmax                     4) gcc/4.8           7) augustus/2.7     10) RepeatMasker/4.0.1
      2) bioinfo-tools              5) openmpi/default   8) exonerate/2.2.0
      3) BioPerl/1.6.1_PERL5.10.1   6) blast/2.2.28+     9) snap/2013-02-16


    perl Build.PL 
    Checking prerequisites...
      requires:
        !  Bio::Root::Version (1.006001) is installed, but we need version >= 1.006901
        !  forks is not installed
        !  forks::shared is not installed
      build_requires:
        !  ExtUtils::CBuilder is not installed


    BioPerl/1.6.910
    =======
    module load BioPerl/1.6.1_PERL5.10.1
    perl Build.PL --install_base /sw/apps/bioinfo/BioPerl/1.6.910/kalkyl
     - ERROR: Test::Most is not installed
    #
    export MY_BIOPERL=/sw/apps/bioinfo/BioPerl/1.6.910/deps
    wget -O- http://cpanmin.us | perl - -l $MY_BIOPERL App::cpanminus local::lib
    echo 'eval `perl -I $MY_BIOPERL/lib/perl5 -Mlocal::lib=$MY_BIOPERL`' >> perlrc
    echo 'export PATH=$MY_BIOPERL/bin/:$PATH' >> perlrc 
    source perlrc
    cpanm Test::Most
    #
    perl Build.PL --install_base /sw/apps/bioinfo/BioPerl/1.6.910/kalkyl
     - live database tests [n]
     - scripts [a]
     - internet tests [n]
