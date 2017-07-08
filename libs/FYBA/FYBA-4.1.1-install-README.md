# FYBA-4.1.1-install-README.md

FYBA/4.1.1
==========

<https://github.com/kartverket/fyba>

OpenFYBA is the source code release of the FYBA library, distributed by the 
National Mapping Authority of Norway (Statens kartverk) to read and write 
files in the National geodata standard format SOSI.

LOG
---

    cd /sw/libs
    mkdir FYBA
    cd FYBA
    VERSION=4.1.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/kartverket/fyba/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    mv fyba-${VERSION} fyba-${VERSION}-${CLUSTER}
    cd fyba-${VERSION}-${CLUSTER}
    module load gcc/4.9.2
    autoreconf --force --install
    ./configure --prefix=/sw/libs/FYBA/$VERSION/$CLUSTER
    make
    make install

Now mf file, starting with libcurl's and add `PKG_CONFIG_PATH`.

    cd ../../../
    mkdir -p mf
    cd mf
    p /sw/libs/libcurl/mf/7.45.0 4.1.1
    ls ../4.1.1/milou/lib/pkgconfig/
    vi 4.1.1 

