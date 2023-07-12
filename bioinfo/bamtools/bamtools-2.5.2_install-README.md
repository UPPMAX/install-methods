bamtools/2.5.2
==============

<https://github.com/pezmaster31/bamtools>

Used under license:
MIT


Structure creating script (makeroom_bamtools_2.5.2.sh) moved to /sw/bioinfo/bamtools/makeroom_2.5.2.sh

LOG
---

    makeroom.sh "-f" "-t" "bamtools" "-v" "2.5.2" "-l" "MIT" "-w" "https://github.com/pezmaster31/bamtools" "-d" "C++ API & command-line toolkit for working with BAM data"
    ./makeroom_bamtools_2.5.2.sh
    source /sw/bioinfo/bamtools/SOURCEME_bamtools_2.5.2
    cd $SRCDIR

Build both static and dynamic libraries, in separate build directories.  Do
static last, so `bamtools` executable links statically.  The pkgconfig file
`bamtools-1.pc` is the same regardless of which is available.

From 2.5.1, use newer gcc, cmake, and also use module zlib.

    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/pezmaster31/bamtools/archive/v${VERSION}.tar.gz
    [[ -d bamtools-${VERSION} ]] && rm -rf bamtools-${VERSION}
    tar xf v${VERSION}.tar.gz
    cd bamtools-${VERSION}
    module load gcc/10.3.0
    module load zlib/1.2.12
    module load cmake/3.26.3
    mkdir build_shared
    cd build_shared
    cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make -j4
    make test && make install
    cd ..
    mkdir build_static
    cd build_static
    cmake -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make -j4
    make test && make install
    cd ../..
    rm -rf bamtools-${VERSION}
    cd $PREFIX
    ln -s lib64 lib

For the mf file, include setting `PKG_CONFIG_PATH`.  Everything else stays the
same.
