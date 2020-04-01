swig/3.0.12
========================

<https://github.com/bcgsc/links>

Used under license:
Misc open source

Structure creating script (makeroom_swig_3.0.12.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/swig/makeroom_3.0.12.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -c "apps" -t "swig" -v "3.0.12" -w "https://github.com/bcgsc/links" -l "Misc open source" -d " code generator for connecting C/C++ with other programming languages"

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

### 2018/11/27


Add the `preinst-swig` executable to the bin directory.

    cp -av preinst-swig ../../rackham/bin/
