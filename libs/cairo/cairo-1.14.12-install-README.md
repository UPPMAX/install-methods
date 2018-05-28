cairo/1.14.12
============

Don't bother with the C++ bindings via cairomm, don't know why the install doesn't work but it doesn't.


LOG
---

    VERSION=1.14.12
    PIXMANVERSION=0.34.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir cairo
    cd cairo/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src_${CLUSTER} ${CLUSTER}
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    cd ${CLUSTER}
    PFX=$PWD
    cd ../src_${CLUSTER}
    wget https://www.cairographics.org/releases/cairo-${VERSION}.tar.xz
    wget https://www.cairographics.org/releases/pixman-${PIXMANVERSION}.tar.gz
    tar xzf pixman-${PIXMANVERSION}.tar.gz 
    cd pixman-${PIXMANVERSION}/
    ./configure --prefix=$PFX
    make -j10
    make install
    cd ..
    rm -rf pixman-${PIXMANVERSION}
    cd $PFX
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
    make -j10
    make install
    cd ..
    rm -rf cairo-${VERSION}

