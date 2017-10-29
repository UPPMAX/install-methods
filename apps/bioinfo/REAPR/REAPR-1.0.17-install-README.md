Installation Docs at ftp://ftp.sanger.ac.uk/pub/resources/software/reapr/Reapr_1.0.17.manual.pdf

According to the docs, the prerequisites are R and Perl with the following modules:
File::Basename, File::Copy, File::Spec, File::Spec::Link, Getopt::Long, List::Util.
Of these, only File::Spec::Link is not part of core (in system or higher Perl).

Install File::Spec::Link
========================
Download File::Spec::Link from CPAN
Unpack to a src dir
Create a perl folder within prog/version/cluster

    mkdir /sw/apps/bioinfo/REAPR/1.0.17/milou/perl

Install Perl module "manually" in local dir

    perl Makefile.PL INSTALL_BASE=/sw/apps/bioinfo/REAPR/1.0.17/milou/perl
    make
    make install

Add to Perl module search list

    export PERL5LIB=/sw/apps/bioinfo/REAPR/1.0.17/milou/perl/lib/perl5



