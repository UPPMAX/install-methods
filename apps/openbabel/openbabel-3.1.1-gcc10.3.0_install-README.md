openbabel/3.1.1-gcc10.3.0
========================

<https://github.com/openbabel/openbabel>

Used under license:
GPL v2

Structure creating script (makeroom_openbabel_3.1.1-gcc10.3.0.sh) moved to /sw/apps/openbabel/makeroom_3.1.1-gcc10.3.0.sh

LOG
---



    TOOL=openbabel
    TOOLVERSION=3.1.1
    GCCVERSION=10.3.0
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
    module load cmake/3.22.2
    module load gcc/${GCCVERSION}
    module load Eigen/3.3.4
    module load zlib/1.2.12
    module load python/3.9.5
    module load boost/1.81.0-gcc${GCCVERSION}
    module load cairo/1.17.4

    cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX -DZLIB_INCLUDE_DIR:PATH=$ZLIB_ROOT/include -DZLIB_LIBRARY_RELEASE:FILEPATH=$ZLIB_ROOT/lib/libz.so -DEIGEN3_INCLUDE_DIR:PATH=$EIGEN_ROOT/include/eigen3 ..

    make -j10 && make install

    cd ..
    rm -rf ${TOOL}-${TOOLVERSION}

