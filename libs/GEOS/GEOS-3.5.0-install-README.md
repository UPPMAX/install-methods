# GEOS-3.5.0-install-README.md

GEOS/3.5.0
==========

<https://trac.osgeo.org/geos/>

GEOS (Geometry Engine - Open Source) is a C++ port of the Java Topology Suite
(JTS). As such, it aims to contain the complete functionality of JTS in C++.
This includes all the OpenGIS Simple Features for SQL spatial predicate
functions and spatial operators, as well as specific JTS enhanced topology
functions.


LOG
---

    VERSION=3.5.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir GEOS
    cd GEOS
    mkdir $VERSION
    cd $VERSION
    mkdir -p src
    mkdir $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src
    wget http://download.osgeo.org/geos/geos-${VERSION}.tar.bz2
    tar xjf geos-${VERSION}.tar.bz2 
    mv geos-${VERSION} geos-${VERSION}_${CLUSTER}
    cd geos-${VERSION}_${CLUSTER}

Since this is desired for R/3.3.0, use the same gcc loaded for that.  Also,
enable Python bindings, but to create these correctly requires a newer Swig
than is on the system, otherwise you'll see some compile errors associated with
definitions of operator overloads.

    module load gcc/4.9.2
    module load python/2.7.6
    module load swig/3.0.7
    ./configure --prefix=$P --enable-python
    make -j 4  # don't use -j on tintin
    make install


Use mf from GDAL.

    cd ../../../mf

Biggest test is if the R package `rgeos` installs successfully when this module
is loaded, which it does.

Do for both milou and tintin.
