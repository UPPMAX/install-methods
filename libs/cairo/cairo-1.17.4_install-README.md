cairo/1.17.4
============

<https://www.cairographics.org/>

Used under license:
LGPL v2.1 or Mozilla Public License 1.1


Structure creating script (makeroom_cairo_1.17.4.sh) moved to /sw/libs/cairo/makeroom_1.17.4.sh



LOG
---

Don't bother with the C++ bindings via cairomm, don't know why the install doesn't work but it doesn't.
Also, note we download pixman from releases/ but cairo comes from snapshots/.

    makeroom.sh -f -t "cairo" -v "1.17.4" -c "libs" -w "https://www.cairographics.org/" -d "a 2D graphics library with support for multiple output devices" -l "LGPL v2.1 or Mozilla Public License 1.1"
    ./makeroom_cairo_1.17.4.sh
    source SOURCEME_cairo_1.17.4
    cd $SRCDIR

    #
    #  pixman
    #
    PIXMANVERSION=0.40.0
    wget https://www.cairographics.org/releases/pixman-${PIXMANVERSION}.tar.gz
    tar xf pixman-${PIXMANVERSION}.tar.gz 
    cd pixman-${PIXMANVERSION}/
    ./configure --prefix=$PREFIX
    make -j10
    make install
    cd ..
    rm -rf pixman-${PIXMANVERSION}
    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
    export LD_RUN_PATH=$PREFIX/lib
    export CPATH=$PREFIX/include

    #
    #  cairo
    #
    #   wget https://www.cairographics.org/releases/cairo-${VERSION}.tar.xz
    wget https://cairographics.org/snapshots/cairo-${VERSION}.tar.xz
    tar xf cairo-${VERSION}.tar.xz
    cd cairo-${VERSION}/
    ./configure --prefix=$PREFIX --enable-gl
    make -j10
    make install
    cd ..
    rm -rf cairo-${VERSION}

