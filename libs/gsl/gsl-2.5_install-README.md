gsl/2.5
=======

<https://www.gnu.org/software/gsl/>

Used under license:
GPL

Structure creating script (makeroom_gsl_2.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/gsl/makeroom_2.5.sh

Gnu Scientific Library 2.5

The GNU Scientific Library (GSL) is a numerical library for C and C++
programmers. It is free software under the GNU General Public License.

The library provides a wide range of mathematical routines such as random
number generators, special functions and least-squares fitting. There are over
1000 functions in total with an extensive test suite.

GNU Scientific Library Reference Manual - Third Edition (January 2009), M. Galassi et al, ISBN 0954612078

<http://www.gnu.org/software/gsl/>


LOG
---

    cd /sw/libs
    TOOL=gsl
    VERSION=2.5
    makeroom.sh -f -t $TOOL -v $VERSION -w https://www.gnu.org/software/gsl/ -c libs -l "GPL" -d "numerical library for C and C++ programmers"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd gsl
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION/src
    [[ -f gsl-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/pub/gnu/gsl/gsl-${VERSION}.tar.gz
    tar xzf gsl-${VERSION}.tar.gz 
    cd gsl-${VERSION}
    module load gcc/6.3.0

    ./configure --prefix=$PREFIX
    make
    make install

    cd $PREFIX
    ln -s lib lib64


So paying attention to the output of make install, we should probably set both
LD_LIBRARY_PATH and LD_RUN_PATH to point to $CLUSTERDIR/lib when loading this 
module.  We should also arrange for include directories via CPATH.  So in the
mf file we need

`LIBRARY_PATH`, `PKG_CONFIG_PATH` and `GSL_ROOT` added 2016-12-19.

    prepend-path PATH                $modroot/bin
    prepend-path LIBRARY_PATH        $modroot/lib
    prepend-path LD_LIBRARY_PATH     $modroot/lib
    prepend-path LD_RUN_PATH         $modroot/lib
    prepend-path CPATH               $modroot/include
    prepend-path CPLUS_INCLUDE_PATH  $modroot/include
    prepend-path MANPATH            $modroot/share/man
    prepend-path PKG_CONFIG_PATH    $modroot/lib/pkgconfig
    setenv       GSL_ROOT            $modroot

