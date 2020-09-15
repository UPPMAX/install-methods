PsN/5.0.0
=========

<https://uupharmacometrics.github.io/PsN/>

Used under license:
GPL 2+

Structure creating script (makeroom_PsN_5.0.0.sh) moved to /sw/apps/PsN/makeroom_5.0.0.sh

LOG
---

    TOOL=PsN
    VERSION=5.0.0
    makeroom.sh -t "PsN" -v "5.0.0" -w "https://uupharmacometrics.github.io/PsN/" -c "apps" -l "GPL 2+" -d "Perl-speaks-NONMEM \(PsN\) is a collection of Perl modules and programs aiding in the development of non-linear mixed effect models using NONMEM" -f"
    ./makeroom_PsN_5.0.0.sh
    cd /sw/apps/$TOOL
    source SOURCEME_PsN_5.0.0
    cd $VERSION/src
    wget https://github.com/UUPharmacometrics/PsN/releases/download/5.0.0/PsN-5.0.0.tar.gz
    tar xzf PsN-5.0.0.tar.gz

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load R/3.6.1
    module load python/3.7.2
    module load MariaDB/10.1.29
    module load pandoc/2.10.1
    module load nonmem/7.4.3

    PERLSITE=$PREFIX/lib/site_perl/5.26.2

Both PREFIX and PERLSITE are needed during installation.  Place PREFIX where it asks for

    PsN Utilities installation directory [/usr/local/bin]:

When it asks for this, leave it at the default:

    Path to perl binary used to run Utilities [/sw/comp/perl/5.26.2/rackham/bin/perl]:

When it asks for this, place the value of PERLSITE:

    PsN Core and Toolkit installation directory [/sw/comp/perl/5.26.2/rackham/lib/site_perl/5.26.2]

and answer y to create the directory.

Answer y to the remaining question.  When it gets to NM versions, it will not
be able to find the correct directory even if you have a nonmem module loaded.
So, use

    /sw/apps/nonmem/7.4.3/rackham
    /sw/apps/nonmem/7.4.4/rackham

and

    /sw/apps/nonmem/7.4.3-intel/snowy
    /sw/apps/nonmem/7.4.4-intel/rackham

and call the first two,

    7_4_3
    7_4_4

and the third and fourth,

    7_4_3_intel
    7_4_4_intel

Make 7_4_4 be the default.

Now add comments on the versions of NONMEM that we support, indicating that
7_4_3 and 7_4_4 are set up to use gcc/8.3.0 and 7_4_3_intel and 7_4_4_intel are
set up to use intel/19.5.  The intel compiler will not work on bianca.

    vi /sw/apps/PsN/5.0.0/rackham/lib/site_perl/5.26.2/PsN_5_0_0/psn.conf

