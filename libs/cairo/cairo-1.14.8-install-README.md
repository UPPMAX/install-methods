cairo/1.14.8
============

Don't bother with the C++ bindings via cairomm, don't know why the install doesn't work but it doesn't.


LOG
---

    VERSION=1.14.8
    PIXMANVERSION=0.34.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir cairo
    cd cairo/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src_${CLUSTER} ${CLUSTER}
    cd ${CLUSTER}
    PFX=$PWD
    cd ../src_${CLUSTER}
    wget https://www.cairographics.org/releases/cairo-${VERSION}.tar.xz
    wget https://www.cairographics.org/releases/pixman-${PIXMANVERSION}.tar.gz
    tar xzf pixman-${PIXMANVERSION}.tar.gz 
    cd pixman-${PIXMANVERSION}/
    ./configure --prefix=$PFX
    make -j8
    make install
    cd ../../${CLUSTER}
    cd lib/pkgconfig
    export PKG_CONFIG_PATH=$PWD
    cd ..
    export LD_RUN_PATH=$PWD
    cd ../include
    export CPATH=$PWD
    cd ../../src_${CLUSTER}
    tar xJf cairo-${VERSION}.tar.xz
    cd cairo-${VERSION}/
    ./configure --prefix=$PFX --enable-gl
    make -j8
    make install

Use a modified mf file from zlib, there are no man pages and one executable.

