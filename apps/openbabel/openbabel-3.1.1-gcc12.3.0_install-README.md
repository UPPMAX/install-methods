openbabel/3.1.1-gcc12.3.0
========================

<https://github.com/openbabel/openbabel>

Used under license:
GPL v2

Structure creating script (makeroom_openbabel_3.1.1-gcc12.3.0.sh) moved to /sw/apps/openbabel/makeroom_3.1.1-gcc12.3.0.sh

LOG
---

    TOOL=openbabel
    TOOLVERSION=3.1.1
    GCCVERSION=12.3.0
    VERSION=$TOOLVERSION-gcc$GCCVERSION

    cd /sw/apps/$TOOL

    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w https://github.com/${TOOL}/${TOOL} -d "chemical toolbox designed to speak the many languages of chemical data, compiled with gcc $GCCVERSION" -l "GPL v2"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget https://github.com/${TOOL}/${TOOL}/releases/download/${TOOL}-${TOOLVERSION//./-}/${TOOL}-${TOOLVERSION}-source.tar.bz2
    tar xf ${TOOL}-${TOOLVERSION}-source.tar.bz2 
    cd ${TOOL}-${TOOLVERSION}/
    mkdir build
    cd build
    module load cmake/3.26.3
    module load gcc/${GCCVERSION}
    module load Eigen/3.3.4
    module load zlib/1.2.12
    module load python/3.10.8
    module load boost/1.83.0-gcc${GCCVERSION}
    module load cairo/1.17.4

There is a failure building with gcc 12 that is fixed in pull request https://github.com/openbabel/openbabel/pull/2493/files so modify the appropriate file according to those changes.

    vi ../src/config.h.cmake

Now configure.

    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX -DZLIB_INCLUDE_DIR:PATH=$ZLIB_ROOT/include -DZLIB_LIBRARY_RELEASE:FILEPATH=$ZLIB_ROOT/lib/libz.so -DEIGEN3_INCLUDE_DIR:PATH=$EIGEN_ROOT/include/eigen3

    make -j10
    make test

There will be a single test failure.

    The following tests FAILED:
        218 - pytest_distgeom (Failed)

This is a known issue with the test itself (https://github.com/openbabel/openbabel/pull/2218/files).

    make install

    cd ..
    rm -rf ${TOOL}-${TOOLVERSION}

Edit mf. Be careful about the locations given to `BABEL_LIBDIR` and `BABEL_DATADIR`.

    cd $TOOLDIR/mf
    vi $VERSION

Wrap up.

    cd $TOOLDIR
    ./openbabel-3.1.1-gcc12.3.0_post-install.sh

