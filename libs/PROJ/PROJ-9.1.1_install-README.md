PROJ/9.1.1
========================

<https://proj.org>

Used under license:
MIT


Structure creating script (makeroom_PROJ_9.1.1.sh) moved to /sw/libs/PROJ/makeroom_9.1.1.sh

LOG
---

    TOOL=PROJ
    VERSION=9.1.1
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-f" "-c" "libs" "-t" "PROJ" "-v" "9.1.1" "-w" "https://proj.org" "-s" "misc" "-l" "MIT" "-d" "Cartographic Projections and Coordinate Transformations Library"
    ./makeroom_PROJ_9.1.1.sh
    source /sw/libs/PROJ/SOURCEME_PROJ_9.1.1 && cd $TOOLDIR
    cd $SRCDIR
    wget https://download.osgeo.org/proj/proj-9.1.1.tar.gz
    tar xzf proj-${VERSION}.tar.gz
    cd proj-${VERSION}
    ml gcc/10.3.0
    ml cmake/3.22.2
    ml libtiff/4.5.0 sqlite/3.34.0
    ml libcurl/7.85.0
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX --build .
    cmake -DSQLITE3_INCLUDE_DIR=$SQLITE_ROOT/include -DSQLITE3_LIBRARY=$SQLITE_ROOT/lib/libsqlite3.so -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    cmake --build .
    cmake --build . --target install

    #NB lib64

