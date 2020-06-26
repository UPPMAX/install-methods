PROJ/6.3.2
==========

<https://proj.org>

<https://github.com/OSGeo/proj.4/wiki>

Used under license:
MIT

Structure creating script (makeroom_PROJ_6.3.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/PROJ/makeroom_6.3.2.sh


LOG
---

    TOOL=PROJ
    VERSION=6.3.2
    mkdir -p /sw/libs/PROJ
    cd /sw/libs/PROJ
    makeroom.sh -f -c "libs" -t "$TOOL" -v "$VERSION" -w "https://proj.org" -s "misc" -l "MIT" -d "Cartographic Projections and Coordinate Transformations Library"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_$(TOOL}_${VERSION}
    cd $VERSION
    cd src
    [[ -f proj-${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/PROJ/releases/download/${VERSION}/proj-${VERSION}.tar.gz
    tar xzf proj-${VERSION}.tar.gz
    cd proj-${VERSION}
    ./configure --prefix=$PREFIX
    make
    make install


