GEOS/3.12.0-gcc12.3.0
=====================

<https://trac.osgeo.org/geos/>

Used under license:
LGPL v2.1


Structure creating script (makeroom_GEOS_3.12.0-gcc12.3.0.sh) moved to /sw/libs/GEOS/makeroom_3.12.0-gcc12.3.0.sh

GEOS (Geometry Engine - Open Source) is a C++ port of the Java Topology Suite
(JTS). As such, it aims to contain the complete functionality of JTS in C++.
This includes all the OpenGIS Simple Features for SQL spatial predicate
functions and spatial operators, as well as specific JTS enhanced topology
functions.



LOG
---

    TOOLVERSION=3.12.0
    GCCVERSION=12.3.0
    VERSION=$TOOLVERSION-gcc$GCCVERSION

    makeroom.sh "-f" "-c" "libs" "-t" "GEOS" "-v" "$VERSION" "-w" "https://trac.osgeo.org/geos/" "-d" "GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products." "-l" "LGPL v2.1"
    ./makeroom_GEOS_3.12.0-gcc12.3.0.sh

    source /sw/libs/GEOS/SOURCEME_GEOS_$VERSION
    cd $SRCDIR

    [[ -f geos-${TOOLVERSION}.tar.bz2 ]] || wget https://download.osgeo.org/geos/geos-$TOOLVERSION.tar.bz2
    [[ -d geos-${TOOLVERSION} ]] && rm -rf geos-${TOOLVERSION}
    tar xf geos-${TOOLVERSION}.tar.bz2 

    cd geos-${TOOLVERSION}/
    mkdir build
    cd build
    module load gcc/$GCCVERSION
    module load python/3.10.8
    module load cmake/3.26.3

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release

    make -j10
    make check
    make install

