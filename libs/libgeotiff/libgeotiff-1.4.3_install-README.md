libgeotiff/1.4.3
========================

<https://github.com/OSGeo/libgeotiff>

Used under license:
Misc open source

Structure creating script (makeroom_libgeotiff_1.4.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/libgeotiff/makeroom_1.4.3.sh

libgeotiff/1.7.1
================

<https://github.com/OSGeo/libgeotiff>

<https://trac.osgeo.org/geotiff>

Used under license:
Misc open source

Structure creating script (makeroom_libgeotiff_1.4.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/libgeotiff/makeroom_1.4.3.sh

TIFF-based interchange format for georeferences raster imagery.

LOG
---

    TOOL=libgeotiff
    VERSION=1.7.1

    makeroom.sh -t ${TOOL} -v ${VERSION} -c libs -w https://github.com/OSGeo/libgeotiff -l Mixed -L https://raw.githubusercontent.com/OSGeo/libgeotiff/master/libgeotiff/LICENSE -d "TIFF-based interchange format for georeferences raster imagery."

    cd /sw/libs
    mkdir libgeotiff
    cd libgeotiff/
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src

    [[ -f libgeotiff-${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/libgeotiff/releases/download/${VERSION}/libgeotiff-${VERSION}.tar.gz

    [[ -d libgeotiff-${VERSION} ]] && rm -rf libgeotiff-${VERSION}

    tar xf libgeotiff-${VERSION}.tar.gz 

    cd libgeotiff-${VERSION}

    module load gcc/10.3.0
    module load sqlite/3.34.0
    module load libtiff/4.5.0
    module load libcurl/7.85.0
    module load PROJ/9.1.1
    module load zlib/1.2.12
    module load doxygen/1.9.6

    ./configure --prefix=$PREFIX --with-zlib --with-jpeg --enable-incode-epsg --enable-doxygen-pdf
    make && make install

