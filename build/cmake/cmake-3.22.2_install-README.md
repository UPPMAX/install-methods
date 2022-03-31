cmake/3.22.2
========================

<https://cmake.org/>

Used under license:
BSD 3-clause


Structure creating script (makeroom_cmake_3.22.2.sh) moved to /sw/build/cmake/makeroom_3.22.2.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "cmake" "-v" "3.22.2" "-c" "build" "-w" "https://cmake.org/" "-d" "open-source, cross-platform family of tools designed to build, test and package software" "-l" "BSD 3-clause"
    ./makeroom_cmake_3.22.2.sh
    makeroom.sh -f -t "cmake" -v "3.22.2" -c "build" -w "https://cmake.org/" -d "open-source, cross-platform family of tools designed to build, test and package software" -l "BSD 3-clause"
    ./makeroom_cmake_3.22.2.sh 
    source /sw/build/cmake/SOURCEME_cmake_3.22.2 && cd $SRCDIR
    cat ../../cmake-3.17.3_install-README.md 
    [[ -f cmake-$VERSION.tar.gz ]] || wget --timestamping https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz
    tar xzf cmake-$VERSION.tar.gz
    cd cmake-$VERSION
    ml gcc/10.3.0
    ./bootstrap --prefix=$PREFIX
    make -j 10
    make install
