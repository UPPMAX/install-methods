BioPerl/1.7.2-Perl5.26.2
========================

Setup
-----

Get environment set up, and once cpanm is downloaded, get it out of the BioPerl bin directory and use it above.

    unset PERL5LIB
    module load perl/5.26.2
    module load perl_modules/5.26.2

    TOOL=BioPerl
    VERSION=1.7.2
    REMOTEVERSION=1.007002
    MODULEVERSION=${VERSION}_Perl5.26.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/bioinfo/$TOOL/$MODULEVERSION
    cd /sw/bioinfo/$TOOL/$MODULEVERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done

    export BIOPERL_DEPS=/sw/bioinfo/${TOOL}/${MODULEVERSION}/${CLUSTER}
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
position, and **after** that, includes directories for both `perl/5.26.2` and
`perl_modules/5.26.2`.  This should happen automatically when following the
above.  For verification purposes, with this install:

    echo $PERL5LIB
    /sw/bioinfo/BioPerl/1.7.2_Perl5.26.2/milou/lib/perl5:/sw/comp/perl_modules/5.26.2/rackham/lib/perl5/x86_64-linux-thread-multi:/sw/comp/perl/5.26.2/rackham/lib

NOTE 2021-09-20
---------------

Warning from /sw/bioinfo/BioPerl/1.7.2_Perl5.26.2/rackham/lib/perl5/Bio/DB/IndexedBase.pm line 845, changed operator from `or` to `||` following <https://raw.githubusercontent.com/bioperl/bioperl-live/2b53e22cd3f61961ea9ac7707537a01e4bf75a73/lib/Bio/DB/IndexedBase.pm>.


BioPerl main collection
-----------------------

Installing `cpanm BioPerl` might get you other than the latest version.
Install by naming it directly.

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
`/sw/bioinfo/BioPerl/1.7.2_Perl5.26.2/rackham/library-dependencies/samtools-0.1.19`
when asked for the location of `bam.h` and `libbam.a`.

For `Bio::DB::HTS`:

    module load bioinfo-tools htslib/1.8
    cpanm Bio::DB::HTS

### Others

    cpanm Bio::Phylo
    cpanm Bio::Graphics
    cpanm Bio::ASN1::EntrezGene
    cpanm Bio::DB::EUtilities
    cpanm Bio::FeatureIO
