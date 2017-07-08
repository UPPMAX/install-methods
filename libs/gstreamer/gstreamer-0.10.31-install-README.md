gstreamer/0.10.31
=================

Needed for building RStudio from source for milou.

LOG
---

    VERSION=0.10.31
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir gstreamer
    cd gstreamer
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    wget https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${VERSION}.tar.gz
    tar xzf gstreamer-${VERSION}.tar.gz
    mv gstreamer-${VERSION} gstreamer-${VERSION}_${CLUSTER}
    cd gstreamer-${VERSION}_${CLUSTER}
    ./configure --prefix=$PFX
    make
    make install

Install an mf file for building against gstreamer.


Installing base plugins
-----------------------

It is easier to install the base plugins if the gstreamer module of the same
version is already available via the module system, so that is what this
procedure assumes.  Do the above, and wait until the module system is updated.

    VERSION=0.10.31
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    module load gstreamer/${VERSION}
    cd /sw/libs/gstreamer/$VERSION/$CLUSTER
    PFX=$PWD
    cd ../src
    wget https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${VERSION}.tar.gz
    tar xzf gst-plugins-base-${VERSION}.tar.gz
    mv gst-plugins-base-${VERSION} gst-plugins-base-${VERSION}_${CLUSTER}
    cd gst-plugins-base-${VERSION}_${CLUSTER}
    ./configure --prefix=$PFX
    make -j 8
    make install
