nonmem/7.4.4
============

<https://www.iconplc.com/innovation/nonmem/>

Used under license:
Commercial


LOG
--

*ZEROTH*, for a new installation, do this:

    TOOL=nonmem
    TOOLVERSION=7.4.4
    VERSION=${TOOLVERSION}
    SQUASHEDVERSION=${TOOLVERSION//./}
    SQUASHEDMMVERSION=${SQUASHEDVERSION%?}
    cd /sw/apps/nonmem
    makeroom.sh -f -t $TOOL -v $VERSION -c apps -w https://www.iconplc.com/innovation/nonmem/ -l "Commercial" -d "very general (non-interactive) model analysis program that can be used to fit models to many different types of data"
    ./makeroom_nonmem_${VERSION}.sh
    source SOURCEME_nonmem_${VERSION}

For a reinstallation, start here instead:

    TOOL=nonmem
    TOOLVERSION=7.4.4
    VERSION=${TOOLVERSION}
    SQUASHEDVERSION=${TOOLVERSION//./}
    SQUASHEDMMVERSION=${SQUASHEDVERSION%?}
    cd /sw/apps/nonmem
    source SOURCEME_nonmem_${VERSION}

*FIRST* build and install mpich2 framework.  I have downloaded a tarball for
old version 1.4.1.

    cd $TOOLDIR/mpich2
    rm -rf build-$VERSION
    mkdir build-$VERSION
    cd build-$VERSION
    ../mpich2-1.4.1/configure --prefix=$PREFIX --with-pm=hydra:gforker:remshell --without-mpe
    make
    make install

*NEXT* build and install NONMEM.

    cd $SRCDIR
    test -f NONMEM${VERSION}.zip || wget https://nonmem.iconplc.com/nonmem750/NONMEM${VERSION}.zip
    unzip -P zorx7bqRT NONMEM${VERSION}.zip
    cd nm${SQUASHEDVERSION}CD
    module load gcc/8.3.0
    ./SETUP${SQUASHEDMMVERSION} $PWD $PREFIX gfortran y ar same rec i

As the installation goes, when the message about licence file comes up, replace
it in another window by updating then running the `makelinks.sh` script within
the `$TOOLDIR/licences/` directory, and then continue the installation.

*THEN* copy the newly built `libmpich.a` into the NONMEM installed subdirectory `$PREFIX/mpi/mpi_ling/` :

    [[ -e $PREFIX/lib/libmpich.a ]] || echo "*** ERROR $PREFIX/lib/libmpich.a not found, the NONMEM installation may have removed it"
    cp -av $PREFIX/lib/libmpich.a $PREFIX/mpi/mpi_ling/


*FINALLY* install the module and test it.  Install the mf file etc so the
module can be loaded.  Testing in a new shell:

    VERSION=7.4.4
    module load nonmem/$VERSION
    cd /sw/apps/nonmem
    source SOURCEME_nonmem_${VERSION}
    cd $VERSIONDIR
    rm -rf testit
    mkdir testit
    cd testit
    cp $NONMEM_ROOT/examples/{foce_parallel.ctl,example1b.csv} .
    cp $NONMEM_ROOT/run/{mpilinux8.pnm,psexec.exe} .
    nmfe74 foce_parallel.ctl foce_parallel.res -parafile=mpilinux8.pnm [nodes]=4

To run a single-threaded version of the test above:

    nmfe74 foce_parallel.ctl foce_parallel.res-single

Compare the runs.

        diff -W $COLUMNS -y foce_parallel.res-single foce_parallel.res

