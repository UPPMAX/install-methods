freetype/2.12.1
============

<https://www.freetype.org/>

Freely available software library to render fonts

Download fonts, as well

LOG
---

    TOOL=freetype
    VERSION=2.12.1

    makeroom.sh -f -c libs -t $TOOL -v $VERSION -w https://freetype.org/ -l "Freetype, GPL v2" -L https://freetype.org/license.html -d "freely available software library to render fonts"
    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/libs/$TOOL/SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    [[ -f freetype-${VERSION}.tar.xz ]] || wget http://download.savannah.gnu.org/releases/freetype/freetype-${VERSION}.tar.xz
    tar xf freetype-${VERSION}.tar.xz

    cd freetype-${VERSION}

    ./configure --prefix=$PREFIX

    make 
    make install

