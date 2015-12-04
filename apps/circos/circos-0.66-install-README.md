# circos-0.66-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

circos 0.66


DESCRIPTION
-----------

Data visualization


WEBSITE
-------

    http://circos.ca


MODULE REQUIREMENTS
-------------------

A bunch of perl modules.  Turns out there are some additional perl modules that
need to be installed that were not checked by the provided tools, all are listed at
http://www.circos.ca/documentation/tutorials/configuration/perl_and_modules/

    Carp
    Clone
    Config::General
    Cwd
    Data::Dumper
    Digest::MD5
    File::Basename
    File::Spec::Functions
    File::Temp
    FindBin
    Font::TTF::Font
    GD
    GD::Image
    GD::Polyline
    Getopt::Long
    IO::File
    List::MoreUtils
    List::Util
    Math::Bezier
    Math::BigFloat
    Math::Round
    Math::VecStat
    Memoize
    Params::Validate
    Pod::Usage
    POSIX
    Readonly
    Regexp::Common
    Set::IntSpan
    Storable
    Sys::Hostname
    Text::Balanced
    Text::Format
    Time::HiRes


LOG
===


    CIRCOS_DIR=/sw/apps/circos
    VERSION=0.66
    CLUSTER=milou
    mkdir -p $CIRCOS_DIR/$VERSION/$CLUSTER
    cd $CIRCOS_DIR/$VERSION/
    mkdir -p src
    cd src
    wget http://circos.ca/distribution/circos-0.66.tgz
    wget http://circos.ca/distribution/circos-tutorials-0.66.tgz
    wget http://circos.ca/distribution/circos-tools-0.18.tgz
    tar xvzf circos-0.66.tgz

Check which perl modules are required, BUT SOME WERE MISSED (see above and below).

    cd circos-$VERSION/bin
    ./test.modules
    cd ..

Now move files to the appropriate cluster directory.

    mv * $CIRCOS_DIR/$VERSION/$CLUSTER/
    cd ..
    rmdir ciros-$VERSION

Now install suggested perl packages.  I am skipping the MySql interface
packages, but will install Spreadsheet::WriteExcel to a local directory
following the script at
https://www.uppmax.uu.se/faq/installing-local-perl-packages and will add this
local directory to PERL5LIB.

The trick to seeing if they are available on a node, quickly, is to log into
a node, fire up a perl debugging session and use the modules in turn, e.g.,

    ssh m208
    perl -d -e 0
    use Carp;
    use Clone;
    etc.

I checked these on both milou and tintin.  The included tools miss a few required
modules.

    export CIRCOS_PERL=$CIRCOS_DIR/$VERSION/$CLUSTER/perl-packages
    mkdir -p $CIRCOS_PERL
    wget -O- http://cpanmin.us | perl - -l $CIRCOS_PERL App::cpanminus local::lib
    echo 'eval `perl -I $CIRCOS_PERL/lib/perl5 -Mlocal::lib=$CIRCOS_PERL`' > ./circos_perl_profile
    echo 'export PATH=$CIRCOS_PERL/bin/:$PATH' >> ./circos_perl_profile
    source ./circos_perl_profile
    cpanm Clone
    cpanm Config::General
    cpanm Font::TTF::Font
    cpanm Math::Round
    cpanm Math::VecStat
    cpanm Params::Validate
    cpanm Readonly
    cpanm Regexp::Common
    cpanm Text::Format
    cpanm Font::TTF
    cpanm Math::Bezier
    cpanm Math::BigFloat
    cpanm Set::IntSpan

Further testing revealed that Params::Validate also require this, which pulls in a bunch more stuff.

    cpanm Module::Implementation


Unpack the tools and tutorials and move them under the cluster directory.

    cd $CIRCOS_DIR/$VERSION/src
    tar xvzf circos-tools-0.18.tgz
    tar xvzf circos-tutorials-0.66.tgz
    mv circos-tools-0.18 circos-tutorials-0.66 ../$CLUSTER/

Create mf file and have it add $CIRCOS_DIR/$VERSION/$CLUSTER/bin to the user PATH.
and $CIRCOS_PERL/lib/perl5 to PERL5LIB.

    mkdir $CIRCOS_DIR/mf
    cd $CIRCOS_DIR/mf
    cp /sw/apps/bioinfo/Stacks/1.19/mf/1.19 0.66
    vi 0.66 

Finally, repeat the above, setting CLUSTER=tintin, except for the mf file which should
be fine.

