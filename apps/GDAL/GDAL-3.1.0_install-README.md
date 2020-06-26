GDAL/3.1.0
==========

<https://www.gdal.org>

Used under license:
X/MIT style Open Source

Structure creating script (makeroom_GDAL_3.1.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/GDAL/makeroom_3.1.0.sh

LOG
---

    TOOL=GDAL
    VERSION=3.1.0
    mkdir -p /sw/apps/GDAL
    cd /sw/apps/GDAL
    makeroom.sh -f -c "apps" -t "$TOOL" -v "$VERSION" -w "https://www.gdal.org" -s "misc" -l "X/MIT style Open Source" -d "translator library for raster and vector geospatial data formats"
    ./makeroom_GDAL_3.1.0.sh
    source SOURCEME_GDAL_3.1.0

    cd $VERSION
    cd src
    [[ -f gdal-${VERSION}.tar.gz ]] || wget http://download.osgeo.org/gdal/${VERSION}/gdal-${VERSION}.tar.gz
    tar xzf gdal-${VERSION}.tar.gz
    cd gdal-${VERSION}

    module load java/sun_jdk1.8.0_151
    module load pcre/8.40
    module load xz/5.2.2
    module load zlib/1.2.11
    module load libcurl/7.45.0
    module load PROJ/6.3.2
    module load FYBA/4.1.1
    module load sqlite/3.24.0
    module load Poppler/0.75.0
    module load JasPer/2.0.14
    module load OpenJPEG/2.3.0

Continuing:

    ./configure --prefix=$PREFIX --with-liblzma=yes --with-python=no --with-sosi=$FYBA_ROOT --with-poppler
    make -j 8
    make install

Use mf from previous install.

