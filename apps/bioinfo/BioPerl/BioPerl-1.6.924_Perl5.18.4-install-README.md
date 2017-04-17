Get environment set up, and once cpanm is downloaded, get it out of the BioPerl bin directory and use it above.

    unset PERL5LIB
    module load perl/5.18.4

    TOOL=BioPerl
    VERSION=1.6.924
    LOCALVERSION=${VERSION}_Perl5.18.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    export BIOPERL_DEPS=/sw/apps/bioinfo/${TOOL}/${LOCALVERSION}/${CLUSTER}
    wget -O- http://cpanmin.us | perl - -l $BIOPERL_DEPS App::cpanminus local::lib

    cd $BIOPERL_DEPS
    mv bin/cpanm .

    echo "export BIOPERL_DEPS=$BIOPERL_DEPS" > ${CLUSTER}-bioperl-deps-setup
    echo 'eval `perl -I $BIOPERL_DEPS/lib/perl5 -Mlocal::lib=$BIOPERL_DEPS`' >> ${CLUSTER}-bioperl-deps-setup
    echo "export PATH=$BIOPERL_DEPS/bin:\$PATH" >> ${CLUSTER}-bioperl-deps-setup
    echo "# now to find cpanm" >> ${CLUSTER}-bioperl-deps-setup
    echo "export PATH=$BIOPERL_DEPS:\$PATH" >> ${CLUSTER}-bioperl-deps-setup
    source ${CLUSTER}-bioperl-deps-setup

Installing GD.  This is a bit of a twist.  First get libgd, and compile it
starting with its ./bootstrap.sh script, but do NOT load the recent
build-tools, it seems to have a problem with newer autoconf.  On milou, it also
fails to substitute @LIBICONV@ in its _build/build-params.  Then the same issue
comes up with GD, and it will not pass tests until ./Build install.  Let me
know if you need help.

    cd libgd-2.1.1
    ./bootstrap.sh
    ./configure --prefix=$BIOPERL_DEPS
    make && make install
    export LD_LIBRARY_PATH=$BIOPERL_DEPS/lib

    cpanm GD

It will fail, at least on milou it can be fixed this way.  Whatever the path is to the `build.log`, change to that.  With the rackham build, I did this

    cd /home/douglas/.cpanm/work/1491159973.1006/
    cd GD-2.56
    cd _build
    vi build_params

Remove the @LIBICONV@ line that did not get substituted.

    cd ..
    ./Build test

It will fail one test, maybe.

    ./Build install
    export LD_LIBRARY_PATH=$BIOPERL_DEPS/lib

Other necessary prereqs.

    cpanm DBI Error Graph GraphViz HTML::Entities HTML::HeadParser XML::Parser XML::Parser::PerlSAX XML::SAX XML::Simple Data::Stag IO::String

More "it would be nice" prereqs.

    cpanm Test::Most Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph Set::Scalar Sort::Naturally Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random


Get BioPerl itself.

    wget http://search.cpan.org/CPAN/authors/id/C/CJ/CJFIELDS/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz
    cd ${TOOL}-${VERSION}
    perl Build.PL

Do not worry about Bio::Phylo or the other modules being missing.  Accept default answers to all questions.

    ./Build test

Some errors might be seen involving GD.  Ah well.

    ./Build install

Now special handling for Bio::DB::Sam.

    mkdir library-dependencies
    cd library-dependencies
    wget http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2
    tar xjf samtools-0.1.19.tar.bz2
    cd samtools-0.1.19
    vi Makefile

Add -fPIC to CFLAGS.

    make

Note 'pwd'.

Now install Bio::DB::Sam.  This needs to be done *after* BioPerl is available
in PERL5LIB or otherwise it will attempt to install BioPerl as a prerequisite.

    cd ../..
    cpanm Bio::DB::Sam

Soon in the build process, it will ask for directory for libbam.a and bam.h,
give it the 'pwd' result for samtools above.

    cpanm Bio::Phylo
    export LD_LIBRARY_PATH=$BIOPERL_DEPS/lib
    cpanm Bio::Graphics

Make sure to add that LD_LIBRARY_PATH setting to the mf file.  See the current
mf file for what seems to be a working config.

