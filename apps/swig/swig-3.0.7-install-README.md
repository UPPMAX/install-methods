swig/3.0.7
==========

<http://www.gdal.org/>

swig is a translator library for raster and vector geospatial data formats.


LOG
---

    VERSION=3.0.7
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps
    mkdir swig
    cd swig
    mkdir $VERSION
    cd $VERSION
    mkdir -p src
    mkdir $CLUSTER
    cd src
    [[ -f swig-${VERSION}.tar.gz ]] || wget https://downloads.sourceforge.net/project/swig/swig/swig-${VERSION}/swig-${VERSION}.tar.gz
    tar xzf swig-${VERSION}.tar.gz
    mv swig-${VERSION} swig-${VERSION}-$CLUSTER
    cd swig-${VERSION}-$CLUSTER
    ./configure --prefix=/sw/apps/swig/$VERSION/$CLUSTER
    make
    make install

