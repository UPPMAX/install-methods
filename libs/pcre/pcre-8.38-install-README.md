# pcre-8.38-install-README.md

pcre/8.38
=========

<http://www.pcre.org/>

Log
---

    VERSION=8.38
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir pcre
    cd pcre/
    mkdir $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd src/
    wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${VERSION}.tar.gz
    tar xzf pcre-${VERSION}.tar.gz 
    mv pcre-${VERSION} pcre-${VERSION}-${CLUSTER}
    cd pcre-${VERSION}-${CLUSTER}
    ./configure --prefix=/sw/libs/pcre/${VERSION}/${CLUSTER}
    make
    make install

Use the xz mf file

    cd ../../../mf
    cp /sw/apps/xz/mf/5.2.2 8.38
    vi 8.38 

