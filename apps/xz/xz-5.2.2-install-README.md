xz/5.2.2
=========

XZ and liblzma

<http://tukaani.org/xz/>

Provides both the xz tool and (perhaps more importantly) the liblzma library.

Log
---

    VERSION=5.2.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps
    mkdir xz
    cd xz
    mkdir -p mf $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/
    [[ -f xz-${VERSION}.tar.gz ]] || wget http://tukaani.org/xz/xz-${VERSION}.tar.gz
    tar xzf xz-${VERSION}.tar.gz 
    mv xz-${VERSION} xz-${VERSION}-${CLUSTER}
    cd xz-${VERSION}-${CLUSTER}
    module load gcc/4.9.2
    ./configure --prefix=$PFX
    make -j4
    make install

Need to add missing symlink.

    cd $PFX/lib
    ln -s liblzma.so.5.2.2 liblzma.so.5.2
    ln -s liblzma.so.5.2.2 liblzma.so.0

Check the mf file for what's done there.

