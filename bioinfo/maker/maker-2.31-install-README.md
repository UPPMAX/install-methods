1. Setup

  Register and Download MAKER 2.31 from http://www.yandell-lab.org/software/maker.html
  mkdir -p /sw/apps/bioinfo/maker/2.31/perl
  cd /sw/apps/bioinfo/maker/2.31
  tar xzf maker-2.31.tgz
  mv maker milou


# 2. Install Perl deps similar to https://www.uppmax.uu.se/faq/installing-local-perl-packages
#    [probably could have done this with the MAKER installer]

#   module load bioinfo-tools gcc/4.8
#   export MY_PERL=/sw/apps/bioinfo/maker/2.31/perl
#   wget -O- http://cpanmin.us | perl - -l $MY_PERL App::cpanminus local::lib
#   echo 'eval `perl -I $MY_PERL/lib/perl5 -Mlocal::lib=$MY_PERL`' >> perl/perlrc
#   echo 'export PATH=$MY_PERL/bin/:$PATH' >> perl/perlrc 
#   source perl/perlrc 
#   cpanm DBD::SQLite
#   cpanm IO::Prompt
#   cpanm File::Which
#   cpanm Perl::Unsafe::Signals
#   cpanm Bit::Vector
#   cpanm Inline::C
#   cpanm forks


3. Currently Loaded Modules:
  1) uppmax          3) gcc/4.8           5) blast/2.2.28+   7) exonerate/2.2.0   9) RepeatMasker/4.0.1
  2) bioinfo-tools   4) openmpi/default   6) augustus/2.7    8) snap/2013-02-16  10) BioPerl/1.6.922


4. Install MAKER

  cd milou/src
  perl Build.PL
    * ignore DBD::Pg suggestion
    * Yes to MPI with suggested paths
    * result should include the following (etc)
      ==============================================================================
      STATUS MAKER 2.31
      ==============================================================================
      PERL Dependencies:	VERIFIED
      External Programs:	VERIFIED
      External C Libraries:	VERIFIED
      MPI SUPPORT:		ENABLED
      MWAS Web Interface:	DISABLED
      MAKER PACKAGE:		CONFIGURATION OK

  ./Build install

