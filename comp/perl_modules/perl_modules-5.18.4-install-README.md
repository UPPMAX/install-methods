perl_modules/5.18.4
===================

A catch-all for Perl modules.  Any time an install wants a Perl module, I put it here.

We should probably do the same for Python.

The version (5.18.4) reflects the version of Perl these accompany.  This, and milou-only, are its current limitations.

Initial setup
-------------

Get environment set up, and once cpanm is downloaded, get it out of the BioPerl bin directory and use it above.

    unset PERL5LIB
    module load perl/5.18.4

    TOOL=perl_modules
    VERSION=5.18.4
    LOCALVERSION=${VERSION}
    CLUSTER=milou

    export MODULE_DEPS=/sw/comp/${TOOL}/${LOCALVERSION}/${CLUSTER}
    wget -O- http://cpanmin.us | perl - -l $MODULE_DEPS App::cpanminus local::lib

    cd $MODULE_DEPS
    mv bin/cpanm .

    setup_script=source-${CLUSTER}-perl_module-deps-setup

    echo "unset PERL5LIB" > $setup_script
    echo "module load perl/5.18.4" >> $setup_script
    echo "TOOL=$TOOL" >> $setup_script
    echo "VERSION=$VERSION" >> $setup_script
    echo "LOCALVERSION=$LOCALVERSION" >> $setup_script
    echo "CLUSTER=$CLUSTER" >> $setup_script
    echo "export MODULE_DEPS=$MODULE_DEPS" >> $setup_script
    echo 'eval `perl -I $MODULE_DEPS/lib/perl5 -Mlocal::lib=$MODULE_DEPS`' >> $setup_script
    echo "export PATH=\$MODULE_DEPS/bin:\$PATH" >> $setup_script
    echo "# now to find cpanm" >> $setup_script
    echo "export PATH=\$MODULE_DEPS:\$PATH" >> $setup_script
    source $setup_script

This is the final script edited by hand, I will update the above to reflect this but not just now.
This is 5.18.4/milou/source-milou-perl_module-deps-setup:


    # unset variables and use minimal path

    unset MODULE_DEPS
    unset PERL5LIB
    unset LD_LIBRARY_PATH
    export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/thinlinc/bin:/sw/uppmax/bin"

    module load perl/5.18.4

    export MODULE_DEPS="/sw/comp/perl_modules/5.18.4/milou"
    export PERL5LIB="$MODULE_DEPS/lib/perl5:$PERL5LIB"
    export LD_LIBRARY_PATH="$MODULE_DEPS/lib"
    export PATH="$MODULE_DEPS/bin:$PATH"
    eval `perl -I $MODULE_DEPS/lib/perl5 -Mlocal::lib=$MODULE_DEPS`
    # now to find cpanm
    export PATH="$MODULE_DEPS:$PATH"

Begin by installing the BioPerl dependencies, which install all their dependencies.

    cpanm DBI Error Graph GraphViz HTML::Entities HTML::HeadParser XML::Parser XML::Parser::PerlSAX XML::SAX XML::Simple Data::Stag IO::String Test::Most Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph Set::Scalar Sort::Naturally Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random

For now GD is installed in the BioPerl trees, but I should install it here as well.  I will address that a bit later.

A few other modules.

    cpanm re::engine::RE2 List::Util List::MoreUtils common::sense YAML::XS Test::FailWarnings Test::Warnings Term::Size Curses Socket::GetAddrInfo 
    cpanm Log::Log4perl HPC::Runner::Slurm HTML::Perlinfo Sort::Rank

Force-install to get around a test failure.

    cpanm --force Acme::Tools

And in preparation for Task::Kensho ...

    cpanm ack

It might work.... if not follow the script as below.

    cpanm Carp::REPL

It will fail tests with the latest Test::Expect
(https://rt.cpan.org/Public/Bug/Display.html?id=103414), so force install.

    cd <cpanm build directory for Carp::REPL>
    make install

Then POE:

    cpanm --interactive POE
    # say no to network tests
    # It will fail a couple tests (http://www.cpantesters.org/distro/P/POE.html)
    cd <cpanm build directory for POE>
    make install

Then a set of 'recommended' modules, I answered all questions with the defaults.  The --interactive is required.

    cpanm --interactive Task::Kensho


After installing everything you want to install, definitely do

    cd $MODULE_DEPS/bin
    head -n 1 *

and check that everything is capable of finding the 5.18.4 perl.  Some will have it hardcoded, some will use env.  We will have to make sure 5.18.4 is loaded when using this module.


Additional modules
------------------

As I encounter additional Perl modules, I install them in this package.  Is there a way to get the list of modules I have actually requested, like with MacPorts?

Apparently not.  I just installed `Array::Unique`, and I'm sure there are others.


Modules 'by hand'
-----------------

FAlite.pm is a widely used lightweight Fasta reader.

    cd $MODULE_DEPS/lib/perl5
    wget http://korflab.ucdavis.edu/Unix_and_Perl/FAlite.pm


Generate list of installed modules
----------------------------------

When in `/sw/comp/perl_modules/5.18.4/milou`:

    ./create_module_table > module_table.html

There will be a few messages to stderr about the search directories, which should be underneath.

See `/sw/comp/perl_modules/5.18.4/milou/README.md` for more on updating the module table on the website.

