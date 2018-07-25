BioPerl/1.7.2-Perl5.24.1
========================

Setup
-----

Get environment set up, and once cpanm is downloaded, get it out of the BioPerl bin directory and use it above.

    unset PERL5LIB
    module load perl/5.24.1
    module load perl_modules/5.24.1

    TOOL=BioPerl
    VERSION=1.7.2
    REMOTEVERSION=1.007002
    MODULEVERSION=${VERSION}_Perl5.24.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    export BIOPERL_DEPS=/sw/apps/bioinfo/${TOOL}/${MODULEVERSION}/${CLUSTER}
    wget -O- http://cpanmin.us | perl - -l $BIOPERL_DEPS --force App::cpanminus local::lib

    cd $BIOPERL_DEPS
    mv bin/cpanm .

    echo "export BIOPERL_DEPS=$BIOPERL_DEPS" > ${CLUSTER}-bioperl-deps-setup
    echo 'eval `perl -I $BIOPERL_DEPS/lib/perl5 -Mlocal::lib=$BIOPERL_DEPS`' >> ${CLUSTER}-bioperl-deps-setup
    echo "export PATH=$BIOPERL_DEPS/bin:\$PATH" >> ${CLUSTER}-bioperl-deps-setup
    echo "# now to find cpanm" >> ${CLUSTER}-bioperl-deps-setup
    echo "export PATH=$BIOPERL_DEPS:\$PATH" >> ${CLUSTER}-bioperl-deps-setup
    source ${CLUSTER}-bioperl-deps-setup

Make sure that `PERL5LIB` holds the directory for this module in the first
position, and **after** that, includes directories for both `perl/5.24.1` and
`perl_modules/5.24.1`.  This should happen automatically when following the
above.  For verification purposes, with this install:

    echo $PERL5LIB
    /sw/apps/bioinfo/BioPerl/1.7.2_Perl5.24.1/milou/lib/perl5:/sw/comp/perl_modules/5.24.1/milou/lib/perl5:/sw/comp/perl_modules/5.24.1/milou/lib/perl5/x86_64-linux-thread-multi:/sw/comp/perl/5.24.1/milou/lib


BioPerl main collection
-----------------------

Installing `cpanm BioPerl` will get you 1.6.923, which is not
helpful.  Install by naming it directly.

    cpanm CJFIELDS/BioPerl-${REMOTEVERSION}.tar.gz


Additional modules
------------------

### SAM/BAM access

For reference, <https://www.biostars.org/p/213040/>

Install `Bio::DB::Sam` and the much newer `Bio::DB::HTS`.  For `Bio::DB::Sam`,
use the custom `samtools` trees from 1.6.924 compiled with `-fPIC` to get
started.  For `Bio::DB::HTS`, simply load the `htslib/1.8` module, which sets
`PKG_CONFIG_PATH` correctly so that the install procedure can find everything
it needs.

    cd $BIOPERL_DEPS
    cp -av ../../1.6.924_Perl5.18.4/src/library-dependencies .
    cpanm Bio::DB::Sam

and then enter
`/sw/apps/bioinfo/BioPerl/1.7.2_Perl5.24.1/rackham/library-dependencies/samtools-0.1.19`
when asked for the location of `bam.h` and `libbam.a`.

For `Bio::DB::HTS`:

    module load bioinfo-tools htslib/1.8
    cpanm Bio::DB::HTS

### Others

    cpanm Bio::Phylo
    cpanm Bio::Graphics

