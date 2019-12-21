SHAPELIB/1.5.0
========================

<http://shapelib.maptools.org/>

Used under license: LGPL v2


Structure creating script (makeroom_SHAPELIB_1.5.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/SHAPELIB/makeroom_1.5.0.sh

LOG
---

    TOOL=SHAPELIB
    VERSION=${VERSION}
    cd /sw/libs
    mkdir ${TOOL}
    cd ${TOOL}/
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w http://shapelib.maptools.org/ -c libs -d "library provides the ability to write simple C programs for reading, writing and updating (to a limited extent) ESRI Shapefiles, and the associated attribute file (.dbf)" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget http://download.osgeo.org/shapelib/shapelib-${VERSION}.tar.gz
    wget http://download.osgeo.org/shapelib/shape_eg_data.zip
    tar xzf shapelib-${VERSION}.tar.gz 
    cd shapelib-${VERSION}/
    echo $PREFIX
    ./configure --help
    module load gcc/6.3.0
    ./configure --prefix=$PREFIX
    make -j4
    make install

Use mf file based on the one from zlib/1.2.11
