perl_modules/5.24.1
===================

A catch-all for Perl modules.  Any time an install wants a Perl module, I put it here.

We should probably do the same for Python.

The version (5.24.1) reflects the version of Perl these accompany.  This is its
current limitation.  The 5.18.4 version was restricted to milou, but no longer.


Initial setup
-------------

Get environment set up, and once cpanm is downloaded, get it out of the bin
directory and use it above.  Create setup script to unset variables and use
minimal path.

    unset PERL5LIB
    module load perl/5.24.1

    TOOL=perl_modules
    VERSION=5.24.1
    LOCALVERSION=${VERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    export MODULE_DEPS=/sw/comp/${TOOL}/${LOCALVERSION}/${CLUSTER}
    wget -O- http://cpanmin.us | perl - -l $MODULE_DEPS App::cpanminus local::lib

    cd $MODULE_DEPS
    mv bin/cpanm .

    setup_script=source-${CLUSTER}-perl_module-deps-setup

    rm -f $setup_script && touch $setup_script

    echo 'unset MODULE_DEPS PERL5LIB LD_LIBRARY_PATH' >> $setup_script
    echo 'VERSION=5.24.1' >> $setup_script
    echo 'CLUSTER=${CLUSTER:?CLUSTER must be set}' >> $setup_script
    echo 'module purge' >> $setup_script
    echo 'module load uppmax' >> $setup_script
    echo 'export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/sw/uppmax/bin' >> $setup_script
    echo 'module load perl/$VERSION' >> $setup_script
    echo "MODULE_DEPS=\"$MODULE_DEPS\"" >> $setup_script
    echo 'export PERL5LIB="$MODULE_DEPS/lib/perl5:$PERL5LIB"' >> $setup_script
    echo 'export LD_LIBRARY_PATH="$MODULE_DEPS/lib"' >> $setup_script
    echo 'export PATH="$MODULE_DEPS/bin:$PATH"' >> $setup_script
    echo 'eval `perl -I $MODULE_DEPS/lib/perl5 -Mlocal::lib=$MODULE_DEPS`' >> $setup_script
    echo '# now modify PATH to find cpanm' >> $setup_script
    echo 'export PATH="$MODULE_DEPS:$PATH"' >> $setup_script
    echo 'echo "Now install new modules with 'cpanm', e.g.,."' >> $setup_script
    echo 'echo' >> $setup_script
    echo 'echo "  cpanm Excel::Writer::XLSX"' >> $setup_script
    echo 'echo' >> $setup_script
    echo 'echo "Create new table with"' >> $setup_script
    echo 'echo' >> $setup_script
    echo 'echo "  ./create_module_table > module_table_DATE.html"' >> $setup_script
    echo 'echo' >> $setup_script

    source $setup_script

First modules
-------------

Install BioPerl dependencies and a bunch of others.

    cpanm GD Net::HTTP LWP::UserAgent XML::Parser XML::XPath IPC::Run XML::Twig LWP::Simple File::Which Test::Pod Parse::RecDescent Parallel::ForkManager

    cpanm Test::Expect DBI Error Graph GraphViz HTML::Entities HTML::HeadParser XML::Parser::PerlSAX XML::SAX XML::Simple Data::Stag IO::String Test::Most

    cpanm Math::CDF Math::BigInt Math::Counting Algorithm::Combinatorics

    cpanm Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph

    cpanm Set::Scalar Sort::Naturally Excel::Writer::XLSX Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random

    cpanm PEDERST/rename-1.9.tar.gz

This last one is a super-convenient file renamer using a perl regexp: `rename 's///' ...files...`


Some intermediate special cases
-------------------------------


### App::Ack

Tests don't pass, on Windows this is expected (<http://stackoverflow.com/questions/1023710/how-can-i-install-and-use-ack-library-on-windows>) but here the failures have

    #   Failed test 'Should have no output to stderr: ack t/text/boy-named-sue.txt --lines=3 -C'
    #   at t/ack-line.t line 82.
    # [
    #   'Insecure $ENV{BASH_ENV} while running with -T switch at t/Util.pm line 325.'
    # ]

so perhaps a taint problem in the test suite.  Force-install it and skip the tests.

    cpanm --force --notest App::Ack


### Tk and Devel::ptkdb

Install Tk and the graphical debugger.

Make sure you are connected with X forwarding in place (`ssh -Y`), to test
this try `xeyes`.

There will be a lot of windows opened up for testing when installing Tk.  They
will steal focus and it is annoying to try to get anything else done while
testing.  Fortunately it last only a couple of minutes.  For me it failed one
test:

    Failed test at t/canvas.t line 252.  got: '255' expected: '215'`.

so I installed `Tk` with force.

    cpanm --force Tk

    cpanm Devel::ptkdb

To debug perl with the graphical debugger, do `perl -d:ptkdb ...args...`.


### re::engine::RE2

    cpanm re::engine::RE2

Here, if `re::engine::RE2` installs from the downloaded source it will fail a
test.  Simply to force installation (try not to do this for this module):

    cpanm --force re::engine::RE2

To be more thorough, the error will list a log file to see for the error; that is the clue to the
local build directory.  Correcting the source for this test is simple.  If the
log lists something like:

    ! Installing re::engine::RE2 failed. See /home/douglas/.cpanm/work/1494600192.27963/build.log for details. Retry with --force to force install it.

then do this:

    pushd .                                        # remember where we were
    cd /home/douglas/.cpanm/work/1494600192.27963  # from the message above
    cd re-engine-RE2-0.13                          # the build directory for this module version
    vi t/ree-pcre/s.t                              # the test that fails

On line 5, change `my $_;` to `local $_;`.  Then

    make && make test && make install  # make (nothing to do), test and install
    popd  # go back to where we were

Make sure it is actually installed with

    cpanm re::engine::RE2

Which will show it up to date.


Continuing ...
--------------

Straightforward installations, and some prereqs for the interactive
installations.

    cpanm List::Util List::MoreUtils common::sense YAML::XS Test::FailWarnings Test::Warnings Term::Size Curses Socket::GetAddrInfo Log::Log4perl HPC::Runner::Slurm

    cpanm HTML::Perlinfo Array::Unique Scalar::Util::Numeric Perl::Tidy Data::Dumper::Perltidy Data::Dumper::Again Carp::REPL Devel::Leak IPC::ShareLite Cache::Cache

    cpanm DBIx::Class::Cursor::Cached Browser::Open PPI::HTML Future Future::Utils Struct::Dumb Devel::MAT Test::Identity Test::Refcount Module::Faker::Dist Plack::Test Test::File Test::LWP::UserAgent

    cpanm Catalyst::Devel Task::Catalyst

    cpanm MooseX::Singleton MooseX::Storage URI::sftp Crypt::Random::Seed Crypt::Random::TESHA2 DateTime::Astro DateTimeX::Easy

    cpanm XS XSLoader XML::LibXML::Simple XML::Compile WWW::Pastebin::PastebinCom::Create UNIVERSAL::ref Unicode::EastAsianWidth Unicode::GCString Unicode::LineBreak Types::Serialiser Time::Piece Time::Seconds Time::HiRes

    cpanm Algorithm::FastPermute Algorithm::Loops Algorithm::Permute Array::Utils Bit::Vector Compress::Raw::Bzip2 Compress::Raw::Zlib Cwd autodie asa CPAN::Meta

    cpanm Text::CSV Text::LineFold Term::ReadLine::Perl5 TAP::Parser Statistics::Basic Statistics::R String::Diff String::Print String::Truncate Set::IntSpan Set::IntervalTree Set::Infinite::Arithmetic Pod::Elemental  Pod::Parser

    cpanm Math::Combinatorics Math::Prime::Util Math::Random::ISAAC Math::Round Logger::Simple Log::Report Method::Inliner MIME::Charset forks GD::Graph Image::PNG Inline Font::TTF

    cpanm Dist::Zilla::App Digest::MD5 File::Spec File::Slurper File::Path File::Map File::Grep Fatal File::Copy::Link Carp::Heavy Convert::BinHex CPAN::Meta::YAML CPAN::Meta::Requirements Cwd Dancer::App 

    cpanm Data::Paginator Data::PowerSet Data::Validate::Domain Data::Validate::IP Data::Validate::URI DateTime::Event::Chinese DateTime::Calendar::Chinese DateTime::Calendar::Japanese::Era DateTime::Format::DateParse DateTime::Format::Epoch

    cpanm DBI::FAQ Declare::Constraints::Simple Declare::Constraints::Simple::Library Devel::CheckBin Devel::CheckCompiler Devel::Hide Env::Path Eval::WithLexicals Eval::WithLexicals::WithHintPersistence ExtUtils::Manifest File::Spec

    cpanm Path::IsDev Parse::Yapp Path::FindDev Perl::Unsafe::Signals PerlIO::gzip Pod::Find


Interactive installations
-------------------------

These are longer, and especially the Task::Kensho takes a long time with many
`y` responses required after several minutes.

Install POE, interactively and say `n` to performing network tests.

    cpanm --interactive POE

Then a set of 'recommended' modules, I answered all questions with the
defaults, unless it asked to install additional optional modules to which I
answered `y`.  The `--interactive` is required.

    cpanm --interactive Task::Kensho


Checking #! lines
-------------------

After installing everything you want to install, definitely do

    cd $MODULE_DEPS/bin
    head -n 1 *

and check that everything is capable of finding the 5.24.1 perl.  Some will
have the path hardcoded, some will use `#!/usr/bin/env perl`.  Make sure none use
`#!/usr/bin/perl` or something like that.

This also means `perl/5.24.1` must be loaded when using this module, but of
course that will be true.

Some pick up the `/pica` prefix for the milou install, but that should be OK
*for the milou install only*.  Another reason to build natively on rackham.

Any additional modules?
-----------------------

If any additional modules are installed here, add them to this section.


For a first installation
------------------------

It doesn't hurt to re-install everything by re-entering the `cpanm ...` lines
during a first install, just to make sure intermediate failures weren't missed.


Generate list of installed modules
----------------------------------

When in `/sw/comp/perl_modules/${VERSION}/${CLUSTER}`:

    ./create_module_table > module_table.html

There will be a few messages to stderr about the search directories, which should be underneath.

See `/sw/comp/perl_modules/${VERSION}/${CLUSTER}/README.md` for more on updating the module table on the website.

