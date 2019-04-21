Poppler/0.75.0
==============

PDF rendering library

<https://poppler.freedesktop.org/>

LOG
---

    VERSION=0.75.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir -p Poppler
    cd Poppler/
    mkdir -p $VERSION && cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir -p src
    cd src
    [[ -f poppler-$VERSION.tar.xz ]] || wget --timestamping https://poppler.freedesktop.org/poppler-$VERSION.tar.xz
    tar xJf poppler-${VERSION}.tar.xz
    cd poppler-${VERSION}
    module load gcc/7.4.0
    module load cairo/1.17.2
    module load cmake/3.13.2
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PFX -DCMAKE_BUILD_TYPE=release -DSPLASH_CMYK=ON -DENABLE_LIBCURL=ON
    make
    make install

Use mf file from previous Poppler, except replace lib with lib64.


