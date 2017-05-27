giflib/5.1.4
============

Provides libgif.so, needed for emacs.

<http://giflib.sourceforge.net/>
<https://sourceforge.net/projects/giflib/files/>

LOG
---

    VERSION=5.1.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs/
    mkdir giflib
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f giflib-$VERSION.tar.bz2 ]] || wget https://downloads.sourceforge.net/project/giflib/giflib-5.1.4.tar.bz2
    tar xjf giflib-${VERSION}.tar.bz2
    mv giflib-${VERSION} giflib-${VERSION}_${CLUSTER}
    cd giflib-${VERSION}_${CLUSTER}
    ./configure --prefix=$PFX
    make
    make install
    cd ../../..
    mkdir mf
    cd mf

Since it provides some executables as well, begin with bzip2's mf.  It only
provides one include file and the static and shared libraries, no pkg-config
information nor man page(s).

    cp /sw/lib/bzip2/mf/1.0.6 $VERSION
    vi $VERSION

