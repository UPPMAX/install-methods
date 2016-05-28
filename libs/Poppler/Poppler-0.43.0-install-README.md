# Poppler-0.43.0-install-README.md

Poppler/0.43.0
==============

PDF rendering library

<https://poppler.freedesktop.org/>

LOG
---

    VERSION=0.43.0
    CLUSTER=milou
    cd /sw/libs
    mkdir Poppler
    cd Poppler/
    mkdir -p $VERSION && cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    wget https://poppler.freedesktop.org/poppler-$VERSION.tar.xz
    unxz poppler-${VERSION}.tar.xz
    tar xf poppler-${VERSION}.tar 
    mv poppler-${VERSION} poppler-${VERSION}-$CLUSTER
    cd poppler-${VERSION}-$CLUSTER/
    module load gcc/4.9.2
    module load libcurl/7.45.0
    ./configure --prefix=/sw/libs/Poppler/$VERSION/$CLUSTER --enable-libcurl --enable-cmyk
    make
    make install

Use mf file from PROJ.4.

    cd /sw/libs/Poppler/mf
    cp /sw/libs/PROJ.4/mf/4.9.2 0.43.0
    vi 0.43.0 
