# GDAL-2.1.0-install-README.md

GDAL/2.1.0
==========

<http://www.gdal.org/>

GDAL is a translator library for raster and vector geospatial data formats.


LOG
---

    VERSION=2.1.0
    CLUSTER=milou
    cd /sw/apps
    mkdir GDAL
    cd GDAL
    mkdir $VERSION
    cd $VERSION
    mkdir -p src
    mkdir $CLUSTER
    cd src
    wget http://download.osgeo.org/gdal/${VERSION}/gdal-${VERSION}.tar.gz
    tar xzf gdal-${VERSION}.tar.gz
    mv gdal-${VERSION} gdal-${VERSION}-$CLUSTER
    cd gdal-${VERSION}-$CLUSTER
    module load FYBA/4.1.1 java/sun_jdk1.8.0_40 gcc/4.9.2 pcre/8.38 xz/5.2.2 zlib/1.2.8 libcurl/7.45.0 PROJ.4/4.9.2 FYBA/4.1.1
    ./configure --prefix=/sw/apps/GDAL/$VERSION/$CLUSTER --with-liblzma=yes --with-python=no --with-sosi=/sw/libs/FYBA/4.1.1/$CLUSTER
    make -j 8
    make install

Use mf from libcurl.

    cd ../../../mf

