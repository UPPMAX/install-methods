bamtools/2.5.1
==============

Build both static and dynamic libraries, in separate build directories.  Do
static last, so `bamtools` executable links statically.  The pkgconfig file
`bamtools-1.pc` is the same regardless of which is available.

LOG
---

    TOOL=bamtools
    VERSION=2.5.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/pezmaster31/bamtools/archive/v${VERSION}.tar.gz
    [[ -d bamtools-${VERSION} ]] && rm -rf bamtools${VERSION}
    tar xzf v${VERSION}.tar.gz
    cd bamtools-${VERSION}
    module load gcc/6.3.0
    module load cmake/3.7.2
    mkdir build_shared
    cd build_shared
    cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$PFX ..
    make -j4
    make install
    cd ..
    mkdir build_static
    cd build_static
    cmake -DCMAKE_INSTALL_PREFIX=$PFX ..
    make -j4
    make install

For the mf file, include setting `PKG_CONFIG_PATH`.  Everything else stays the
same.
