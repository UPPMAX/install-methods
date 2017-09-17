# gsl-2.1-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Gnu Scientific Library 2.1

DESCRIPTION
-----------

The GNU Scientific Library (GSL) is a numerical library for C and C++
programmers. It is free software under the GNU General Public License.

The library provides a wide range of mathematical routines such as random
number generators, special functions and least-squares fitting. There are over
1000 functions in total with an extensive test suite.

    GNU Scientific Library Reference Manual - Third Edition (January 2009),
    M. Galassi et al, ISBN 0954612078

WEBSITE
-------

    http://www.gnu.org/software/gsl/

MODULE REQUIREMENTS
-------------------

Built with

    gcc/4.8.3


LOG
---

    TOOL=/sw/apps/gsl
    VERSION=2.1
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p mf $VERSION
    cd $TOOLDIR
    mkdir -p src $CLUSTER 
    cd src
    wget http://ftp.df.lth.se/pub/ftp.gnu.org/pub/gnu/gsl/gsl-${VERSION}.tar.gz
    tar xzf gsl-${VERSION}.tar.gz 
    cd gsl-${VERSION}/

Now load pieces for the build and build it.

    module load build-tools
    module load gcc/4.9.2

    ./configure --prefix=$CLUSTERDIR
    make
    make install

So paying attention to the output of make install, we should probably set both
LD_LIBRARY_PATH and LD_RUN_PATH to point to $CLUSTERDIR/lib when loading this 
module.  We should also arrange for include directories via CPATH.  So in the
mf file we need

`LIBRARY_PATH`, `PKG_CONFIG_PATH` and `GSL_ROOT` added 2016-12-19.

    prepend-path GSL_ROOT          $modroot
    prepend-path PATH              $modroot/bin
    prepend-path LIBRARY_PATH      $modroot/lib
    prepend-path LD_LIBRARY_PATH   $modroot/lib
    prepend-path LD_RUN_PATH       $modroot/lib
    prepend-path CPATH             $modroot/include
    prepend-path MANPATH           $modroot/share/man
    prepend-path PKG_CONFIG_PATH   $modroot/lib/pkgconfig

2016-12-19: We also must symlink `lib64` to `lib` or dump gcc might not link it correctly.

    cd $CLUSTERDIR
    ln -s lib lib64

Set up for other systems.

    cd $TOOLDIR
    ln -s ./milou nestor
    ln -s ./milou halvan

Repeat for tintin.

