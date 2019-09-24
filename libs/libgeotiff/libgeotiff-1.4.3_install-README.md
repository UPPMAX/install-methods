libgeotiff/1.4.3
========================

<https://github.com/OSGeo/libgeotiff>

<https://trac.osgeo.org/geotiff>

Used under license:
Misc open source

Structure creating script (makeroom_libgeotiff_1.4.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/libgeotiff/makeroom_1.4.3.sh

libgeotiff/1.4.1
================


TIFF-based interchange format for georeferences raster imagery.

LOG
---

    VERSION=1.4.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir libgeotiff
    cd libgeotiff/
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    [[ -f libgeotiff-${VERSION}.tar.gz ]] || wget http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-${VERSION}.tar.gz
    tar xzf libgeotiff-${VERSION}.tar.gz 
    cd libgeotiff-${VERSION}
    module load PROJ.4/4.9.3
    module load zlib/1.2.11
    module load doxygen/1.8.11
    ./configure --prefix=$PREFIX --with-zlib --with-jpeg --enable-incode-epsg --enable-doxygen-pdf
    make && make install

