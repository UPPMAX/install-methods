PsN/5.3.1
========================

<https://uupharmacometrics.github.io/PsN/>

Used under license:
GPL 2+


Structure creating script (makeroom_PsN_5.3.0.sh) moved to /sw/apps/PsN/makeroom_5.3.0.sh

LOG
---

    TOOL=PsN
    VERSION=5.3.1
    cd /sw/apps/$TOOL    
    makeroom.sh -t $TOOL -v $VERSION -w "https://uupharmacometrics.github.io/PsN/" -c "apps" -l "GPL 2+" -d "Perl-speaks-NONMEM \(PsN\) is a collection of Perl modules and programs aiding in the development of non-linear mixed effect models using NONMEM" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    [[ -e ${TOOL}-${VERSION}.tar.gz ]] || wget https://github.com/UUPharmacometrics/PsN/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    [[ -e PsN-Source ]] && rm -rf PsN-Source
    tar xzf ${TOOL}-${VERSION}.tar.gz

    cd PsN-Source

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load R_packages/4.1.1
    module load python/3.8.7
    module load MariaDB/10.1.29
    module load pandoc/2.17.1.1
    module load cairo/1.17.4
    module load nonmem/7.5.1
    module load ImageMagick/7.0.11-3
    module load libcurl/7.45.0

    PERLSITE=$PREFIX/lib/site_perl/5.26.2

Both PREFIX and PERLSITE are needed during installation.

Now do

    echo PREFIX=$PREFIX
    echo PERLSITE=$PERLSITE
    perl setup.pl

PREFIX=/sw/apps/PsN/5.3.1/rackham
PERLSITE=/sw/apps/PsN/5.3.1/rackham/lib/site_perl/5.26.2

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
    /sw/apps/nonmem/7.5.1/rackham

and call the them,

    7_3_0
    7_4_3
    7_4_4
    7_5_0
    7_5_1

Make 7_5_1 be the default.

Now add comments on the versions of NONMEM that we support, indicating that
7_3_0, 7_4_3, 7_4_4, 7_5_0 and 7_5_0 are set up to use gcc/8.3.0.

    vi /sw/apps/PsN/${VERSION}/rackham/lib/site_perl/5.26.2/PsN_5_3_1/psn.conf

Also, add an additional `module_dir_name=1` option under `[default_execute_options]`:

    [default_execute_options]
    display_iterations=1
    model_dir_name=1

Test

    cd $PREFIX/lib/site_perl/5.26.2/PsN_test_5_3_1/
    prove unit
    prove system




