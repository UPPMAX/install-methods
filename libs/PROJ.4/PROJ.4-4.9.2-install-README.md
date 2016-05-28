# PROJ.4-4.9.2-install-README.md

PROJ.4/4.9.2
============

Cartographic Projections Library

<https://github.com/OSGeo/proj.4/wiki>


LOG
---

    VERSION=4.9.2
    CLUSTER=milou
    cd /sw/libs
    mkdir PROJ.4
    cd PROJ.4/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    wget https://github.com/OSGeo/proj.4/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    mv proj.4-${VERSION} proj.4-${VERSION}-${CLUSTER}
    cd proj.4-${VERSION}-${CLUSTER}
    ./configure --prefix=/sw/libs/PROJ.4/$VERSION/$CLUSTER
    make
    make install

Use mf from FYBA.

    cd ../../..
    mkdir mf
    cd mf
    cp ../../FYBA/mf/4.1.1 4.9.2
    vi 4.9.2 

    cd ../..
    fixup -g PROJ.4

