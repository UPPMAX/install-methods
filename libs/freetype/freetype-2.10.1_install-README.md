freetype/2.10.1
============

<https://www.freetype.org/>

Freely available software library to render fonts

Download fonts, as well

LOG
---

    VERSION=2.10.1
    cd /sw/libs
    mkdir -p freetype
    cd freetype/
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    [[ -f freetype/freetype-${VERSION}.tar.gz ]] || wget http://download.savannah.gnu.org/releases/freetype/freetype-${VERSION}.tar.gz
    tar xzf freetype-${VERSION}.tar.gz
    cd freetype-${VERSION}
    ./configure --prefix=$PREFIX
    make 
    make install

Use mf from 2.6

    cd ../../../mf
    cp 2.6 2.7.1
    vi 2.7.1

