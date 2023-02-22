libgeotiff/1.7.1
================

<https://github.com/OSGeo/libgeotiff>

<https://trac.osgeo.org/geotiff>

Used under license:
Mixed
<https://raw.githubusercontent.com/OSGeo/libgeotiff/master/libgeotiff/LICENSE>


TIFF-based interchange format for georeferences raster imagery.

LOG
---

    TOOL=libgeotiff
    VERSION=1.7.1

    makeroom.sh -t ${TOOL} -v ${VERSION} -c libs -w https://github.com/OSGeo/libgeotiff -l Mixed -L https://raw.githubusercontent.com/OSGeo/libgeotiff/master/libgeotiff/LICENSE -d "TIFF-based interchange format for georeferences raster imagery."

    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/libs/libgeotiff/SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    [[ -f libgeotiff-${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/libgeotiff/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.gz

    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}

    tar xf ${TOOL}-${VERSION}.tar.gz 

    cd libgeotiff-${VERSION}

    module load cmake/3.22.2
    module load gcc/10.3.0
    module load sqlite/3.34.0
    module load libtiff/4.5.0
    module load libcurl/7.85.0
    module load PROJ/9.1.1
    module load zlib/1.2.12
    module load doxygen/1.9.6

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DTIFF_INCLUDE_DIR=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH:BOOL=YES

    make -j3

    make install

Now build static library.

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DTIFF_INCLUDE_DIR=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH:BOOL=YES

    make -j3

    make install
