GEOS/3.9.1-gcc9.3.0
========================

<https://trac.osgeo.org/geos/>

Used under license:
LGPL v2.1

Structure creating script (makeroom_GEOS_3.9.1-gcc9.3.0.sh) moved to /sw/libs/GEOS/makeroom_3.9.1-gcc9.3.0.sh

GEOS (Geometry Engine - Open Source) is a C++ port of the Java Topology Suite
(JTS). As such, it aims to contain the complete functionality of JTS in C++.
This includes all the OpenGIS Simple Features for SQL spatial predicate
functions and spatial operators, as well as specific JTS enhanced topology
functions.


LOG
---

Contains autotools files (`configure` etc) but they say that is deprecated and
recommend cmake.  Also, the swig API stuff compiled into our 3.5.0 module
doesn't seem to be included in 3.9.1 so we just skip it.


    TOOL=GEOS
    TOOLVERSION=3.9.1
    GCCVERSION=9.3.0
    VERSION=${TOOLVERSION}-gcc${GCCVERSION}
    cd /sw/libs/$TOOL
    makeroom.sh -f -c libs -t $TOOL -v $VERSION -w https://trac.osgeo.org/geos/ -d "GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products." -l "LGPL v2.1"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget http://download.osgeo.org/geos/geos-${TOOLVERSION}.tar.bz2
    tar xf geos-${TOOLVERSION}.tar.bz2 
    cd geos-${TOOLVERSION}/
    mkdir build
    cd build
    module load gcc/$GCCVERSION
    module load cmake/3.17.3
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release ..
    make -j10
    make install

