perl_modules/5.26.2
===================

A catch-all for Perl modules.  Any time an install wants a Perl module, I put it here.

We should probably do the same for Python.

The version (5.26.2) reflects the version of Perl these accompany.  This is its
current limitation.  The 5.18.4 version was restricted to milou, but no longer.

IMPORTANT
---------

Perl does not provide a 'site' method to specify where these modules are
located akin to R's `R_LIBS_SITE` variable: we are modifying `PERL5LIB` along
with users and other modules.

For this reason, members of group `sw` can step on the contents of this module
when installing perl modules either for themselves or for other modules.

The cluster trees beneath the version directories are write-protected by default:

    rackham5: /sw/comp/perl_modules/5.26.2 $ ll
    total 8
    lrwxrwxrwx 1 douglas sw    7 Aug  9  2017 bianca -> rackham
    lrwxrwxrwx 1 douglas sw    7 Aug  9  2017 irma -> rackham
    dr-xr-sr-x 5 douglas sw 4096 May  3 16:26 milou
    dr-xr-sr-x 5 douglas sw 4096 Sep 28  2017 rackham

These need to be de-write-protected prior to installing additional modules, for
example:

    chmod -R ug+w rackham

After the installation is completed, they need to be closed back down.

    chmod -R -w rackham

This is not possible to do without being the actual owner of the tree.  It was
possible to get around this on SL6 by doing `cp -av` of the tree to a temp
name, removing the existing tree, and `mv` the temp name to the name of the
existing tree.  But on CentOs7 I believe it is not possible to remove files
even if you share their group.

For the time being, the owner of the tree handles installs there in
coordination with other app experts that need the installs there.  Perhaps
there can be another solution but this is not that inconvenient.


Initial setup
-------------

**See below for adding new modules**

Get environment set up, and once cpanm is downloaded, get it out of the bin
directory and use it above.  Create setup script to unset variables and use
minimal path.

    VERSION=5.26.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    unset PERL5LIB
    module load perl/${VERSION}
    TOOL=perl_modules
    LOCALVERSION=${VERSION}
    export MODULE_DEPS=/sw/comp/${TOOL}/${LOCALVERSION}/${CLUSTER}
    unset PERL5LIB
    module load perl/${VERSION}

    wget -O- http://cpanmin.us | perl - -l $MODULE_DEPS App::cpanminus local::lib

    cd $MODULE_DEPS
    mv bin/cpanm .

    setup_script=source-${CLUSTER}-perl_module-deps-setup

    rm -f $setup_script && touch $setup_script

    echo 'unset MODULE_DEPS PERL5LIB LD_LIBRARY_PATH' >> $setup_script
    echo 'VERSION=5.26.2' >> $setup_script
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


Adding new modules
------------------

If you are adding new modules, rather than setting up a new version, follow
these steps.  Then use `cpanm` as below.

    VERSION=5.26.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    unset PERL5LIB
    module load perl/${VERSION}
    TOOL=perl_modules
    LOCALVERSION=${VERSION}
    export MODULE_DEPS=/sw/comp/${TOOL}/${LOCALVERSION}/${CLUSTER}
    cd $MODULE_DEPS
    setup_script=source-${CLUSTER}-perl_module-deps-setup

    source $setup_script


First modules
-------------

Install BioPerl dependencies and a bunch of others.

    cpanm GD Net::HTTP LWP::UserAgent XML::Parser XML::XPath IPC::Run XML::Twig LWP::Simple File::Type File::Which Test::Pod Parse::RecDescent Parallel::ForkManager

    cpanm Test::Expect DBI Error Graph GraphViz HTML::Entities HTML::HeadParser XML::Parser::PerlSAX XML::SAX XML::Simple Data::Stag IO::String Test::Most

    cpanm Math::CDF Math::BigInt Math::Counting Algorithm::Combinatorics

    cpanm Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph

    cpanm Set::Scalar Sort::Naturally Sort::Rank Excel::Writer::XLSX Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random

    cpanm VCF

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


### Acme::Tools

Force-install to get around a test failure.

    cpanm --force Acme::Tools

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

    cpanm List::Util List::MoreUtils common::sense YAML::XS Test::FailWarnings Test::Warnings Term::Size Curses
    cpanm Unicode::EastAsianWidth Unicode::GCString Unicode::LineBreak
    cpanm Text::SimpleTable
    cpanm Socket::GetAddrInfo Log::Log4perl HPC::Runner::Slurm
    cpanm HTML::Perlinfo Array::Unique Scalar::Util::Numeric Perl::Tidy Data::Dumper::Perltidy Data::Dumper::Again
    cpanm Carp::REPL Devel::Leak IPC::ShareLite Cache::Cache
    cpanm DBIx::Class::Cursor::Cached Browser::Open PPI::HTML Future Future::Utils Struct::Dumb Devel::MAT
    cpanm Test::Identity Test::Refcount Module::Faker::Dist Plack::Test Test::File Test::LWP::UserAgent
    cpanm Catalyst::Devel Task::Catalyst
    cpanm MooseX::Singleton MooseX::Storage URI::sftp Crypt::Random::Seed Crypt::Random::TESHA2 DateTime::Astro DateTimeX::Easy

WWW::Pastebin::PastebinCom::Create has a silly error when http got to https in matching. Just --force it. 
Also, UNIVERSAL::ref is not functional since perl 5.25.1

    cpanm --force WWW::Pastebin::PastebinCom::Create  
    cpanm XS XSLoader XML::LibXML::Simple XML::Compile #UNIVERSAL::ref 
    cpanm Encode Unicode::Map Unicode::Map8 Unicode::String
    enc2xs -C  # this creates default Unicode encodings and the Encode::ConfigLocal module
    cpanm Types::Serialiser Time::Piece Time::Seconds Time::HiRes Algorithm::FastPermute Algorithm::Loops Algorithm::Permute
    cpanm Array::Utils Bit::Vector Compress::Raw::Bzip2 Compress::Raw::Zlib Cwd autodie asa CPAN::Meta

String::Diff has a test that fails due to new yaml versions. Just --force install it.

    cpanm --force String::Diff  
    cpanm Text::CSV Text::LineFold Term::ReadLine::Perl5 TAP::Parser Statistics::Basic Statistics::R String::Print
    cpanm String::Truncate Set::IntSpan Set::IntervalTree Set::Infinite::Arithmetic Pod::Elemental  Pod::Parser
    cpanm Math::Combinatorics Math::Prime::Util Math::Random::ISAAC Math::Round Logger::Simple Log::Report Method::Inliner 
    cpanm MIME::Charset forks GD::Graph Image::PNG Inline Font::TTF
    cpanm Dist::Zilla::App Digest::MD5 File::Spec File::Slurper File::Path File::Map File::Grep Fatal File::Copy::Link
    cpanm Carp::Heavy Convert::BinHex CPAN::Meta::YAML CPAN::Meta::Requirements Cwd Dancer::App 
    cpanm Data::Paginator Data::PowerSet Data::Validate::Domain Data::Validate::IP Data::Validate::URI DateTime::Event::Chinese
    cpanm DateTime::Calendar::Chinese DateTime::Calendar::Japanese::Era DateTime::Format::DateParse DateTime::Format::Epoch
    cpanm DBI::FAQ Declare::Constraints::Simple Declare::Constraints::Simple::Library Devel::CheckBin Devel::CheckCompiler
    cpanm Devel::Hide Env::Path Eval::WithLexicals Eval::WithLexicals::WithHintPersistence ExtUtils::Manifest File::Spec
    cpanm Path::IsDev Parse::Yapp Path::FindDev Perl::Unsafe::Signals PerlIO::gzip Pod::Find
    cpanm Math::Bezier Math::VecStat Text::Format Graph::Writer::Dot

Load MariaDB/10.1.29 before installing DBD::mysql

    cpanm Algorithm::Munkres Class::AutoClass Convert::Binary::C Data::Stag::Writer DB_File DBD::mysql GD::SVG Graph::Directed GraphViz
    cpanm HTML::Entities HTML::HeadParser HTML::Parser HTML::TableExtract HTTP::Request::Common IO::String IO::Scalar List::MoreUtils
    cpanm LWP::UserAgent PostScript::TextBlock Scalar::Util Set::Scalar SOAP::Lite Sort::Naturally Spreadsheet::ParseExcel Storable

XML::DOM::XPath has a test error, --force it!
    
    cpanm --force XML::DOM::XPath 
    cpanm SVG SVG::Graph Text::ParseWords XML::DOM XML::LibXML XML::Parser XML::Parser::PerlSAX XML::SAX XML::SAX::Writer
    cpanm XML::Simple XML::Twig XML::Writer YAML
    cpanm Statistics::Zed Statistics::Standard_Normal Statistics::Cook Statistics::TopK Statistics::ANOVA Statistics::Robust
    cpanm Statistics::Simpson Statistics::Shannon Statistics::Discrete Statistics::Sequences Statistics::ChiSquare
    cpanm Statistics::Frequency Statistics::Histogram Statistics::MaxEntropy Statistics::Contingency Statistics::FisherPitman
    cpanm Statistics::KruskalWallis Statistics::RankCorrelation Statistics::ANOVA::KW Statistics::ANOVA::JT Statistics::Data::Rank
    cpanm Statistics::ANOVA::Page Statistics::ANOVA::Friedman Statistics::Sequences::Runs Statistics::Sequences::Pot
    cpanm Statistics::Sequences::Turns Statistics::Sequences::Joins Statistics::Sequences::Vnomes Statistics::Data::Dichotomize
    cpanm Statistics::Diversity::Shannon Statistics::Sampler::Multinomial Statistics::Distributions::GTest
    cpanm Statistics::Descriptive::LogScale Statistics::Descriptive::Discrete Statistics::Distributions::Bartlett 
    cpanm Math::MatrixReal 
    cpanm Config::Simple
    # cpanm Sort::Fields  # this will not install in perl_modules/5.26.2
    cpanm Text::NSP

    cpanm File::Util File::Path File::Basename Getopt::Long Text::Levenshtein::XS String::Approx MCE MCE::Loop MCE::Shared

Additional statistics-oriented modules.  Two have pod errors and another has an
odd error and these two must be forced.

    cpanm --force Statistics::Normality Statistics::FactorAnalysis


Modules 'by hand'
-----------------

FAlite.pm is a widely used lightweight Fasta reader.

    cd $MODULE_DEPS/lib/perl5
    wget http://korflab.ucdavis.edu/Unix_and_Perl/FAlite.pm


Interactive installations
-------------------------

These are longer, and especially the Task::Kensho takes a long time with many
`y` responses required after several minutes.

Install POE, interactively and say `y` to skipping network tests.

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

and check that everything is capable of finding the 5.26.2 perl.  Some will
have the path hardcoded, some will use `#!/usr/bin/env perl`.  Make sure none use
`#!/usr/bin/perl` or something like that.

This also means `perl/5.26.2` must be loaded when using this module, but of
course that will be true.


For a first installation
------------------------

It doesn't hurt to re-install everything by re-entering the `cpanm ...` lines
during a first install, just to make sure intermediate failures weren't missed.
Do it! I caught a couple of weird things that I would have missed otherwise.
Also, remember to turn off testing for Tk.


Generate list of installed modules
----------------------------------

When in `/sw/comp/perl_modules/${VERSION}/${CLUSTER}`:
    cp -av ../../5.26.2/rackham/create_module_table .
    cp -av ../../5.26.2/rackham/README.md .
    ./create_module_table > module_table.html
    tail -2 README.md | head -1 > module_table_again.html; ./create_module_table >> module_table_180720.html

There will be a few messages to stderr about the search directories, which should be underneath.

See `/sw/comp/perl_modules/${VERSION}/${CLUSTER}/README.md` for more on updating the module table on the website.

