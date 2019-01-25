MUMmer/4.0.0beta2
==================

MUMmer 4.0.0beta2 is available as a release.  There are two commits after this
beta release, but I couldn't get the autoreconf to work after a few minutes so
I am punting.

<https://github.com/mummer4/mummer>


LOG
---

Must the mf file add library directories to `LD_LIBRARY_PATH`?


    TOOL=MUMmer
    VERSION=4.0.0beta2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    SRCDIR=$PWD
    [[ -f mummer-${VERSION}.tar.gz ]] || wget https://github.com/mummer4/mummer/releases/download/v${VERSION}/mummer-${VERSION}.tar.gz
    [[ -d mummer-${VERSION} ]] && rm -rf mummer-${VERSION}
    module load gcc/6.3.0
    tar xzf mummer-${VERSION}.tar.gz 
    cd mummer-${VERSION}
    ./configure --prefix=$PFX
    make
    make install


Not necessary to load a perl module.  Also, allowing OpenMP during
configuration.  There is a `--disable-openmp` flag I could set, but I am
leaving it as is.

For the mf file, no need to add library directories to `LD_LIBRARY_PATH`.
There are library and header files but also pkg-config file, so don't add the
library or include directories, but do add `$modroot/lib/pkgconfig` to
`PKG_CONFIG_PATH`.  Add `$modroot/bin` as well as `$modroot/libexec/mummer` to
PATH.



Below is **not used**.


MUMmer/4.0.0beta2-277dac5
-------------------------

MUMmer 4.0.0beta2 but there are two commits after this beta release, removing
openmp pragmas and doing a better job of specifying default number of threads.

<https://github.com/mummer4/mummer>

LOG
---

Must the mf file add library directories to `LD_LIBRARY_PATH`?


`COMMIT_HASH` holds the full hash for the commit we want.  For versioning, we
want the first 7 characters.  After cloning the repository, reset the head to
our chosen commit.


    TOOL=MUMmer
    COMMIT_HASH=277dac5222ca19a59b09657b523bf9d2f088d6a3
    VERSION=4.0.0beta2-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL/$VERSION
    cd /sw/apps/bioinfo/$TOOL/$VERSION
    [[ -d src ]] && rm -rf src
    mkdir $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    SRCDIR=$PWD

    module load git/2.16.1
    git clone https://github.com/mummer4/mummer
    cd mummer
    git reset --hard $COMMIT_HASH

    module load gcc/6.3.0
    module load perl/5.24.1

I could not get `autoreconfi -fi` to work, multiple errors of this form, ending with:

    Makefile.am:193:   'unittests/Makefile.am' included from here
    swig/Makefile.am:65: warning: variable '%C%_ruby_mummer_la_LDFLAGS' is defined but no program or
    swig/Makefile.am:65: library has '%C%_ruby_mummer_la' as canonical name (possible typo)
    Makefile.am:188:   'swig/Makefile.am' included from here
    swig/Makefile.am:85: warning: variable '%C%_perl5_mummer_la_LDFLAGS' is defined but no program or
    swig/Makefile.am:85: library has '%C%_perl5_mummer_la' as canonical name (possible typo)
    Makefile.am:188:   'swig/Makefile.am' included from here
    swig/Makefile.am:42: warning: variable '%C%_python__mummer_la_LDFLAGS' is defined but no program or
    swig/Makefile.am:42: library has '%C%_python__mummer_la' as canonical name (possible typo)
    Makefile.am:188:   'swig/Makefile.am' included from here
    autoreconf: automake failed with exit status: 1

and loading some autotools didn't help:

    module load automake/1.15.1 autoconf/2.69 swig/3.0.7

A `./configure` file gets built despite the errors, but does not work.  Attempting:

    ./configure --prefix=$PWD

with this file ends with:

    checking for OpenMP flag of C++ compiler... -fopenmp
    checking for yaggo... false
    checking for gnuplot... /usr/bin/gnuplot
    checking for __int128... yes
    checking if std::thread::sleep_for is supported... yes
    checking for perl... /sw/comp/perl/5.24.1/rackham/bin/perl
    checking for Perl prefix... /sw/comp/perl/5.24.1/rackham
    checking for Perl extension include path... /sw/comp/perl/5.24.1/rackham/lib/5.24.1/x86_64-linux-thread-multi/CORE
    checking for Perl extension target directory... /sw/comp/perl/5.24.1/rackham/lib/site_perl/5.24.1/x86_64-linux-thread-multi
    checking for Perl extensions C preprocessor flags... -D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -fstack-protector-strong -I/usr/local/include
    checking for Perl extensions linker flags... -shared -O2 -L/usr/local/lib -fstack-protector-strong
    configure: compiling with flags: CXXFLAGS=-DNDEBUG -std=c++0x -g -O2
    checking that generated files are newer than configure... done
    configure: creating ./config.status
    config.status: error: cannot find input file: `Makefile.in'

