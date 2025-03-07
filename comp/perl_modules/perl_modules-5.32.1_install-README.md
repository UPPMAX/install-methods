perl_modules/5.32.1
===================

A catch-all for Perl modules.  Any time an install wants a Perl module, I put it here.

We should probably do the same for Python.

The version (5.32.1) reflects the version of Perl these accompany.  This is its
current limitation.  The 5.18.4 version was restricted to milou, but no longer.

IMPORTANT
---------

Perl does not provide a 'site' method to specify where these modules are
located akin to R's `R_LIBS_SITE` variable: we are modifying `PERL5LIB` along
with users and other modules.

For this reason, members of group `sw` can step on the contents of this module
when installing perl modules either for themselves or for other modules.

The cluster trees beneath the version directories are write-protected by default.

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

    TOOL=perl_modules
    VERSION=5.32.1

    makeroom.sh -f -c comp -t $TOOL -v $VERSION -l "GPL v1+ or Artistic License" -d "Omnibus module providing many Perl modules for perl/$VERSION"
    ./makeroom_perl_modules_5.32.1.sh

    source /sw/comp/perl_modules/SOURCEME_perl_modules_5.32.1
    cd $SRCDIR

    export MODULE_DEPS=$PREFIX
    unset PERL5LIB
    module load perl/${VERSION}

    wget -O- http://cpanmin.us | perl - -l $MODULE_DEPS App::cpanminus local::lib

    cd $MODULE_DEPS
    mv bin/cpanm .

    setup_script=source-${CLUSTER}-perl_module-deps-setup

    rm -f $setup_script && touch $setup_script

    echo 'unset MODULE_DEPS PERL5LIB LD_LIBRARY_PATH' >> $setup_script
    echo 'VERSION=5.32.1' >> $setup_script
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

    cd /sw/comp/perl_modules/5.32.1/rackham
    source source-rackham-perl_module-deps-setup


First modules
-------------

Install BioPerl dependencies and a bunch of others.

    cpanm GD Net::HTTP LWP::UserAgent XML::Parser XML::XPath IPC::Run XML::Twig LWP::Simple File::Type File::Which Test::Pod Parse::RecDescent Parallel::ForkManager
    cpanm --force GD

    cpanm Test::Expect DBI Error Graph Graph::Easy GraphViz HTML::Entities HTML::HeadParser XML::Parser::PerlSAX XML::SAX XML::Simple Data::Stag IO::String Test::Most
    cpanm Math::CDF Math::BigInt Math::Counting Algorithm::Combinatorics
    cpanm Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph
    cpanm Set::Scalar Sort::Naturally Sort::Rank Sort::Fields Excel::Writer::XLSX Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random
    cpanm VCF Pod::Select

Tests used to fail for these, no longer.

    cpanm App::Ack
    cpanm re::engine::RE2

A super-convenient file renamer using a perl regexp: `rename 's///' ...files...`

    cpanm PEDERST/rename-1.14.tar.gz


Some intermediate special cases
-------------------------------

    cpanm --force MooseX::Getopt::Usage::Role::Man
    cpanm --force Acme::Tools

### Use a newer compiler

    ml gcc/12.3.0
    cpanm Devel::MAT::Dumper
    cpanm Syntax::Keyword::Match

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
    cpanm Sort::Fields
    cpanm Text::NSP

    cpanm File::Util File::Path File::Basename File::Grep Getopt::Long Text::Levenshtein::XS String::Approx MCE MCE::Loop MCE::Shared
    cpanm PDF::Table PDF::API2 List::Permutor List::Compare VCF::Reader Text::Password File::Type File::Tail File::Find App::find2perl File::Copy File::Util

Additional modules with failing tests.

    cpanm --force Statistics::Normality Statistics::FactorAnalysis
    cpanm --force Code::TidyAll

    cpanm --force XMLRPC::Lite
    cpanm XML::Atom XML::Compile XML::RSS XML::Tags XML::LibXSLT XString XS::Parse::Infix XS::Parse::Keyword YAML
    cpanm Tree::Simple
    cpanm Types::Common Type::Tie UUID::Tiny
    cpanm Unicode::Collate Unicode::EastAsianWidth Unicode::GCString Unicode::LineBreak Unicode::Map Unicode::Map8 Unicode::Normalize Unicode::String
    cpanm Text::NSP
    cpanm Text::Levenshtein::XS
    cpanm Software::License Software::LicenseUtils Sort::Fields  Sort::Rank
    cpanm SQL::Abstract SQL::Translator
    cpanm DBI
    cpanm --force GD
    cpanm Tie::IxHash forks List::MoreUtils DBD::SQLite Config::General  Inline::C  IO::Prompt GD Parallel::ForkManager Perl::Unsafe::Signals Spreadsheet::WriteExcel Test::Most Test::Most Algorithm::Munkres Array::Compare Clone Convert::Binary::C HTML::TableExtract List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph Set::Scalar Sort::Naturally Spreadsheet::ParseExcel XML::SAX::Writer XML::Writer YAML XML::LibXML XML::DOM::XPath XML::DOM DBD::SQLite Math::Random Text::Levenshtein::XS String::Approx Getopt::Std  MCE MCE::Loop MCE::Shared

    cpanm Lingua::BioYaTeA Tree::Cladogram GD::SVG TMDB CGI::WebToolkit Perl6::Form Tesla::Vehicle MCE::Shared Sah::Schema::language::code Audio::DB E2::User Devel::Monitor EEDB::Chrom SQL::Statement::Functions MOBY::CommonSubs CPAN::Reporter::Smoker Net::SSLeay MOSES::MOBY::Base Net::GitHub::V3 Net::GitHub Number::RangeTracker Data::Type::RFC Data::Type XML::EasySQL Data::Printer::Filter::DB IMDB::Persons Role::Tiny Role::Basic

    cpanm Const::Fast File::Sort MIME::Lite Shell::Guess Shell::Config::Generate  

    cpanm Sys::Mmap
    cpanm PerlIO::mmap  ## this will not work, needs perl 5.38
    cpanm PDL

    cpanm MIDI::Util
    cpanm Music::MelodicDevice::Ornamentation
    cpanm Music::MelodicDevice::Inversion
    cpanm Music::MelodicDevice::Transposition
    cpanm --force Music::Tag

    cpanm HTML::HTML5::ToText
    cpanm HTML::HTML5::Table
    cpanm HTML::HTML5::ToText::Trait::RenderTables
    cpanm HTML::FormatText
    cpanm HTML::FormatText::WithLinks HTML::FormatText::WithLinks::AndTables
    cpanm LEOCHARRE::HTML::Text


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
    cpanm --interactive Task::Kensho::All


Checking #! lines
-------------------

After installing everything you want to install, definitely do

    cd $MODULE_DEPS/bin
    head -n 1 *

and check that everything is capable of finding the 5.32.1 perl.  Some will
have the path hardcoded, some will use `#!/usr/bin/env perl`.  Make sure none use
`#!/usr/bin/perl` or something like that.

This also means `perl/5.32.1` must be loaded when using this module, but of
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

    cp -av ../../5.32.1/rackham/create_module_table .
    cp -av ../../5.32.1/rackham/README.md .
    ./create_module_table > module_table_20231201.html

There will be a few messages to stderr about the search directories, which should be underneath.
Create cleartext version that is referenced in the module help.

    html2text --pad-tables module_table_20231201.html > module_table_20231201.txt

    ln -s module_table_20231201.txt module_table.txt


See `/sw/comp/perl_modules/${VERSION}/${CLUSTER}/README.md` for more on updating the module table on the website.

