# libgeotiff-1.4.1-install-README.md

libgeotiff/1.4.1
================

<https://trac.osgeo.org/geotiff>

TIFF-based interchange format for georeferences raster imagery.

LOG
---

    VERSION=1.4.1
    CLUSTER=milou
    cd /sw/libs
    mkdir libgeotiff
    cd libgeotiff/
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    wget http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-${VERSION}.tar.gz
    tar xzf libgeotiff-${VERSION}.tar.gz 
    mv libgeotiff-${VERSION} libgeotiff-${VERSION}-$CLUSTER
    cd libgeotiff-${VERSION}-$CLUSTER
    module load gcc/4.9.2
    module load PROJ.4/4.9.2
    module load zlib/1.2.8
    module load doxygen/1.8.9.1
    ./configure --prefix=/sw/libs/libgeotiff/$VERSION/$CLUSTER --with-zlib --with-jpeg --enable-incode-epsg --enable-doxygen-pdf
    make && make install

Repeat for tintin.

Use mf from PROJ.4, no pkgconfig.  Load PROJ.4 and zlib in the mf file.

    cd /sw/libs/libgeotiff/mf
    cd mf
    cp /sw/libs/PROJ.4/mf/4.9.2 1.4.1
    vi 1.4.1 


