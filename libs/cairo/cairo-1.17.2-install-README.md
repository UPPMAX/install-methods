cairo/1.17.2
============

Don't bother with the C++ bindings via cairomm, don't know why the install doesn't work but it doesn't.


LOG
---

    VERSION=1.17.2
    PIXMANVERSION=0.36.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir -p cairo
    cd cairo
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir src ${CLUSTER}
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    #
    #  pixman
    #
    wget https://www.cairographics.org/releases/pixman-${PIXMANVERSION}.tar.gz
    tar xzf pixman-${PIXMANVERSION}.tar.gz 
    cd pixman-${PIXMANVERSION}/
    ./configure --prefix=$PFX
    make -j10
    make install
    cd ..
    rm -rf pixman-${PIXMANVERSION}
    export PKG_CONFIG_PATH=$PFX/lib/pkgconfig
    export LD_RUN_PATH=$PFX/lib
    export CPATH=$PFX/include
    #
    #  cairo
    #
    #   wget https://www.cairographics.org/releases/cairo-${VERSION}.tar.xz
    wget https://cairographics.org/snapshots/cairo-${VERSION}.tar.xz
    tar xJf cairo-${VERSION}.tar.xz
    cd cairo-${VERSION}/
    ./configure --prefix=$PFX --enable-gl
    make -j10
    make install
    cd ..
    rm -rf cairo-${VERSION}

