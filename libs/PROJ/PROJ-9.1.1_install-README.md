PROJ/9.1.1
========================

<https://proj.org>

Used under license:
MIT


Structure creating script (makeroom_PROJ_9.1.1.sh) moved to /sw/libs/PROJ/makeroom_9.1.1.sh

DGS: rebuilding, since libtiff/4.5.0 was not found by the cmake configuration process. We must provide the definitions:

    -DTIFF_INCLUDE_DIR:PATH=$LIBTIFF_ROOT/include
    -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so

LOG
---

    TOOL=PROJ
    VERSION=9.1.1

    makeroom.sh "-f" "-c" "libs" "-t" "PROJ" "-v" "9.1.1" "-w" "https://proj.org" "-s" "misc" "-l" "MIT" "-d" "Cartographic Projections and Coordinate Transformations Library"
    ./makeroom_PROJ_9.1.1.sh

    source /sw/libs/PROJ/SOURCEME_PROJ_9.1.1
    cd $SRCDIR

    wget https://download.osgeo.org/proj/proj-9.1.1.tar.gz
    tar xzf proj-${VERSION}.tar.gz

    cd proj-${VERSION}

    module load cmake/3.26.3
    module load gcc/10.3.0
    module load libtiff/4.5.0
    module load sqlite/3.34.0
    module load libcurl/7.85.0
    module load python/3.9.5

    mkdir build_shared build_static

Build both static and shared libraries.

    cd build_static
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DSQLITE3_INCLUDE_DIR=$SQLITE_ROOT/include -DSQLITE3_LIBRARY=$SQLITE_ROOT/lib/libsqlite3.so -DTIFF_INCLUDE_DIR:PATH=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so
    make -j 10
    make install
    cd ..

    cd build_shared
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS:BOOL=ON -DCMAKE_BUILD_TYPE=Release -DSQLITE3_INCLUDE_DIR=$SQLITE_ROOT/include -DSQLITE3_LIBRARY=$SQLITE_ROOT/lib/libsqlite3.so -DTIFF_INCLUDE_DIR:PATH=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so
    make -j 10
    make install
    cd ..


Adjust RPATH for libproj shared library.

    cd $PREFIX/lib
    module load patchelf/0.10
    module load gcc/10.3.0
    module load libtiff/4.5.0
    module load sqlite/3.34.0
    module load libcurl/7.85.0
    patchelf --set-rpath "$LD_RUN_PATH" libproj.so.25.9.1.1


Add `$modroot/lib64/cmake/proj` to CMAKE_MODULE_PATH

