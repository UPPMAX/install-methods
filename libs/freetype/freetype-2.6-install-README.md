# freetype-2.6-install-README.md

freetype/2.6
============

<https://www.freetype.org/>

Freely available software library to render fonts

LOG
---

    VERSION=2.6
    CLUSTER=milou
    cd /sw/libs
    mkdir -p freetype
    cd freetype/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir -p src
    mkdir $CLUSTER
    cd src
    wget http://download.savannah.gnu.org/releases/freetype/freetype-${VERSION}.tar.gz
    tar xzf freetype-${VERSION}.tar.gz
    mv freetype-$VERSION freetype-$VERSION-$CLUSTER
    cd freetype-$VERSION-$CLUSTER
    ./configure --prefix=/sw/libs/freetype/$VERSION/$CLUSTER
    make 
    make install

Use mf from PROJ.4.

    cd ../../../mf
    cp /sw/libs/PROJ.4/mf/4.9.2 2.6
    vi 2.6

    cd ../..
    fixup -g freetype
