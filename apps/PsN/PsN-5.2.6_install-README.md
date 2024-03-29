PsN/5.2.6
========================

<https://uupharmacometrics.github.io/PsN/>

Used under license:
GPL 2+


Structure creating script (makeroom_PsN_5.2.6.sh) moved to /sw/apps/PsN/makeroom_5.2.6.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -c "apps" -t "PsN" -v "5.2.6" -l "GPL 2+" -w "https://uupharmacometrics.github.io/PsN/" -d "Perl-speaks-NONMEM \(PsN\) is a collection of Perl modules and programs aiding in the development of non-linear mixed effect models using NONMEM"
    ./makeroom_PsN_5.2.6.sh


    TOOL=PsN
    VERSION=5.0.0
    makeroom.sh -t "PsN" -v "5.0.0" -w "https://uupharmacometrics.github.io/PsN/" -c "apps" -l "GPL 2+" -d "Perl-speaks-NONMEM \(PsN\) is a collection of Perl modules and programs aiding in the development of non-linear mixed effect models using NONMEM" -f"
    ./makeroom_PsN_5.2.6.sh
    cd /sw/apps/$TOOL
    source SOURCEME_PsN_5.2.6
    cd $SRCDIR
    [[ -e PsN-5.2.6.tar.gz ]] || wget https://github.com/UUPharmacometrics/PsN/releases/download/5.2.6/PsN-5.2.6.tar.gz
    [[ -e PsN-Source ]] && rm -rf PsN-Source
    tar xzf PsN-5.2.6.tar.gz

    cd PsN-Source

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load R_packages/4.0.4
    module load python/3.8.7
    module load MariaDB/10.1.29
    module load pandoc/2.10.1
    module load nonmem/7.5.0
    module load SymEngine/0.7.0

    PERLSITE=$PREFIX/lib/site_perl/5.26.2

Both PREFIX and PERLSITE are needed during installation.

Now do

    echo PREFIX=$PREFIX
    echo PERLSITE=$PERLSITE
    perl setup.pl

Place PREFIX where it asks for

    PsN Utilities installation directory [/usr/local/bin]:

When it asks for this, leave it at the default:

    Path to perl binary used to run Utilities [/sw/comp/perl/5.26.2/rackham/bin/perl]:

When it asks for this, place the value of PERLSITE:

    PsN Core and Toolkit installation directory [/sw/comp/perl/5.26.2/rackham/lib/site_perl/5.26.2]

and answer y to create the directory.

Answer y to the remaining question.  When it gets to NM versions, it will not
be able to find the correct directory even if you have a nonmem module loaded.
So, use

    /sw/apps/nonmem/7.3.0/rackham
    /sw/apps/nonmem/7.4.3/rackham
    /sw/apps/nonmem/7.4.4/rackham
    /sw/apps/nonmem/7.5.0/rackham

and call the them,

    7_3_0
    7_4_3
    7_4_4
    7_5_0

Make 7_5_0 be the default.

Now add comments on the versions of NONMEM that we support, indicating that
7_3_0, 7_4_3, 7_4_4 and 7_5_0 are set up to use gcc/8.3.0.

    vi /sw/apps/PsN/5.2.6/rackham/lib/site_perl/5.26.2/PsN_5_2_6/psn.conf

Also, add an additional `module_dir_name=1` option under '[default_execute_options]':

    [default_execute_options]
    display_iterations=1
    model_dir_name=1

Test 
    cd rackham/lib/site_perl/5.26.2/PsN_test_5_2_6/
    prove unit
    prove system
