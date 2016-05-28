# xz-5.2.2-install-README.md

XZ and liblzma

xz/75.2.2
=========

<http://tukaani.org/xz/>

Provides both the xz tool and (perhaps more importantly) the liblzma library.

Log
---

    VERSION=5.2.2
    CLUSTER=milou
    cd /sw/apps
    mkdir xz
    cd xz
    mkdir -p mf $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd src/
    wget http://tukaani.org/xz/xz-${VERSION}.tar.gz
    tar xzf xz-${VERSION}.tar.gz 
    mv xz-${VERSION} xz-${VERSION}-${CLUSTER}
    cd xz-${VERSION}-${CLUSTER}
    module load gcc/4.9.2
    ./configure --prefix=/sw/apps/xz/$VERSION/$CLUSTER
    make
    make install

Need to add missing symlink.

    cd ../../$CLUSTER/lib
    ln -s liblzma.so.5.2.2 liblzma.so.5.2
    ln -s liblzma.so.5.2.2 liblzma.so.0

Check the mf file for what's done there.

