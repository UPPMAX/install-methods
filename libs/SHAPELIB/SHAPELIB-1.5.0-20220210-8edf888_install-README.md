SHAPELIB/1.5.0-20220210-8edf888
===============================

<http://shapelib.maptools.org/>

<https://github.com/OSGeo/shapelib>


Used under license: LGPL v2


Structure creating script (makeroom_SHAPELIB_1.5.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/SHAPELIB/makeroom_1.5.0.sh

LOG
---

    TOOL=SHAPELIB
    COMMIT=8edf888
    VERSIONTAG=1.5.0-20220210
    VERSION=${VERSIONTAG}-${COMMIT}

    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w http://shapelib.maptools.org/ -c libs -d "library provides the ability to write simple C programs for reading, writing and updating (to a limited extent) ESRI Shapefiles, and the associated attribute file (.dbf)" 
    ./makeroom_${TOOL}_${VERSION}.sh 

    source /sw/libs/SHAPELIB/SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    ml git/2.34.1
    ml gcc/10.3.0

    git clone --recursive https://github.com/OSGeo/shapelib
    cd shapelib
    git reset --hard $COMMIT

    ./autogen.sh 
    ./configure --prefix=$PREFIX

    make
    make check
    make install

Check library loads: it finds its own for all executables, but
`Shape_PointInPoly` is a C++ executable and picks up the system libstcd++ and
libgcc rather than the module ones. This is OK, we have these on the system for
a reason, but still force it to find the module ones.

    ml purge
    ml gcc/10.3.0
    cd $PREFIX/bin

    patchelf --set-rpath "$(patchelf --print-rpath Shape_PointInPoly):$LD_RUN_PATH" Shape_PointInPoly 
    ml purge
    ldd Shape_PointInPoly 
