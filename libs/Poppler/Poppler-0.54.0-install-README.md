Poppler/0.54.0
==============

PDF rendering library

<https://poppler.freedesktop.org/>

LOG
---

    VERSION=0.54.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir Poppler
    cd Poppler/
    mkdir -p $VERSION && cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir -p src
    cd src
    [[ -f poppler-$VERSION.tar.xz ]] || wget --timestamping https://poppler.freedesktop.org/poppler-$VERSION.tar.xz
    tar xJf poppler-${VERSION}.tar.xz
    mv poppler-${VERSION} poppler-${VERSION}-$CLUSTER
    cd poppler-${VERSION}-$CLUSTER/
    module load gcc/5.4.0
    module load libcurl/7.45.0
    module load cairo/1.14.8
    ./configure --prefix=$PFX --enable-libcurl --enable-cmyk
    make
    make install

Use mf file from previous Poppler.
