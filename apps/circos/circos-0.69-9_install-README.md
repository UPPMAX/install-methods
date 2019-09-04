circos/0.69-9
=============

<http://circos.ca>


LOG
---

Fortunately circos can check on its own whether it has the modules it requires.
We will remove the `$CLUSTER` directory and replace it with the unpacked circos
directory.

Download tools and tutorials as well.


    makeroom.sh -t circos -v 0.69-9 -c apps -w http://circos.ca -d "Circos is a software package for visualizing data and information. It visualizes data in a circular layout — this makes Circos ideal for exploring relationships between objects or positions. There are other reasons why a circular layout is advantageous, not the least being the fact that it is attractive." -l GPL
    ./makeroom_circos_0.69-9.sh 
    cd /sw/apps/circos
    source SOURCEME_circos_0.69-9 
    cd $VERSION
    cd src
    TOOLSVERSION=0.23
    TUTORIALSVERSION=0.67
    wget http://circos.ca/distribution/circos-${VERSION}.tgz 
    wget http://circos.ca/distribution/circos-tools-${TOOLSVERSION}.tgz
    wget http://circos.ca/distribution/circos-tutorials-${TUTORIALSVERSION}.tgz
    tar xzf circos-${VERSION}.tgz
    rmdir $PREFIX
    mv circos-${VERSION} $PREFIX
    cd $PREFIX

    module load perl/5.26.2
    module load perl_modules/5.26.2

    cd bin
    ./circos -modules

When I did this, it produced this output:

    rackham5: /sw/apps/circos/0.69-9/rackham/bin $ ./circos -modules
    ok       1.50 Carp
    ok       0.39 Clone
    ok       2.63 Config::General
    ok       3.74 Cwd
    ok      2.167 Data::Dumper
    ok       2.55 Digest::MD5
    ok       2.85 File::Basename
    ok       3.74 File::Spec::Functions
    ok     0.2308 File::Temp
    ok       1.51 FindBin
    ok       0.39 Font::TTF::Font
    ok       2.68 GD
    ok        0.2 GD::Polyline
    ok       2.49 Getopt::Long
    ok       1.16 IO::File
    ok      0.428 List::MoreUtils
    ok        1.5 List::Util
    ok       0.01 Math::Bezier
    ok   1.999813 Math::BigFloat
    ok       0.07 Math::Round
    ok       0.08 Math::VecStat
    ok    1.03_01 Memoize
    ok       1.76 POSIX
    ok       1.29 Params::Validate
    ok       1.69 Pod::Usage
    ok       2.05 Readonly
    ok 2017060201 Regexp::Common
    ok       2.84 SVG
    ok       1.19 Set::IntSpan
    ok     1.6611 Statistics::Basic
    ok       3.11 Storable
    ok       1.20 Sys::Hostname
    ok       2.03 Text::Balanced
    ok       0.61 Text::Format
    ok     1.9758 Time::HiRes


Unpack the tools and tutorials and move them under the cluster directory.

    cd $VERSIONDIR/src
    tar xzf circos-tools-${TOOLSVERSION}.tgz
    tar xzf circos-tutorials-${TUTORIALSVERSION}.tgz
    mv circos-tools-${TOOLSVERSION} circos-tutorials-${TUTORIALSVERSION} $PREFIX/

Create mf file and have it add `$PREFIX/bin` to the user PATH and load `perl/5.26.2` and `perl_modules/5.26.2`.

