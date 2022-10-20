gsl/2.7
=======

build separate for snowy and rackham.


<https://www.gnu.org/software/gsl/>

Used under license:
GPL

GNU Scientific Library Reference Manual - Third Edition (January 2009), M. Galassi et al, ISBN 0954612078



LOG
---

    TOOL=gsl
    VERSION=2.7

    makeroom.sh -f -t $TOOL -v $VERSION -w https://www.gnu.org/software/gsl/ -c libs -l "GPL" -d "numerical library for C and C++ programmers"
    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/libs/gsl/SOURCEME_${TOOL}_${VERSION} && cd $SRCDIR

    [[ -f gsl-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/pub/gnu/gsl/gsl-${VERSION}.tar.gz
    [[ -d gsl-$VERSION ]] || rm -rf gsl-$VERSION
    tar xzf gsl-${VERSION}.tar.gz 
    cd gsl-${VERSION}
    module load gcc/10.3.0

    ./configure --prefix=$PREFIX
    make
    make check
    make install

    cd $PREFIX
    ln -s lib lib64

Build separately for rackham, miarka (on miarka3) and snowy/bianca (on snowy-lr1).

So paying attention to the output of make install, we should probably set both
LD_LIBRARY_PATH and LD_RUN_PATH to point to $CLUSTERDIR/lib when loading this 
module.  We should also arrange for include directories via CPATH.  So in the
mf file we need

    prepend-path PATH                $modroot/bin
    prepend-path LIBRARY_PATH        $modroot/lib
    prepend-path LD_LIBRARY_PATH     $modroot/lib
    prepend-path LD_RUN_PATH         $modroot/lib
    prepend-path CPATH               $modroot/include
    prepend-path CPLUS_INCLUDE_PATH  $modroot/include
    prepend-path M4PATH              $modroot/share/aclocal
    prepend-path INFOPATH            $modroot/share/info
    prepend-path MANPATH             $modroot/share/man
    prepend-path PKG_CONFIG_PATH     $modroot/lib/pkgconfig
    setenv       GSL_ROOT            $modroot

