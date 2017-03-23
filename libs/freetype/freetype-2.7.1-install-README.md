freetype/2.7.1
============

<https://www.freetype.org/>

Freely available software library to render fonts

LOG
---

    VERSION=2.7.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p freetype
    cd freetype/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir -p src $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src
    [[ -f freetype/freetype-${VERSION}.tar.gz ]] || wget http://download.savannah.gnu.org/releases/freetype/freetype-${VERSION}.tar.gz
    tar xzf freetype-${VERSION}.tar.gz
    mv freetype-${VERSION} freetype-${VERSION}_${CLUSTER}
    cd freetype-${VERSION}_${CLUSTER}
    ./configure --prefix=$P
    make 
    make install

Use mf from 2.6

    cd ../../../mf
    cp 2.6 2.7.1
    vi 2.7.1

