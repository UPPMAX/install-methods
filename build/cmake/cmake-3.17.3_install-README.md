cmake/3.17.3
========================

<https://cmake.org/>

Used under license:
BSD 3-clause

Structure creating script (makeroom_cmake_3.17.3.sh) moved to /sw/build/cmake/makeroom_3.17.3.sh

LOG
---

    TOOL=cmake
    VERSION=3.17.3
    cd /sw/build/$TOOL
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -c "build" -w "https://cmake.org/" -d "open-source, cross-platform family of tools designed to build, test and package software" -l "BSD 3-clause"
    ./makeroom_cmake_3.17.3.sh
    source SOURCEME_cmake_3.17.3
    cd $VERSION
    cd src
    [[ -f cmake-$VERSION.tar.gz ]] || wget --timestamping https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz
    tar xzf cmake-$VERSION.tar.gz 
    cd cmake-$VERSION
    module load gcc/8.4.0
    ./bootstrap --prefix=$PREFIX
    make
    make install

