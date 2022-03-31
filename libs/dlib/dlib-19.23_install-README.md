dlib/19.23
========================

<http://dlib.net/>

Used under license:
Boost 1.0
<http://dlib.net/license.html>

Structure creating script (makeroom_dlib_19.23.sh) moved to /sw/libs/dlib/makeroom_19.23.sh

LOG
---


    cd /sw/libs/dlib
    makeroom.sh -f -t dlib -v 19.23 -c libs -w http://dlib.net/ -l "Boost 1.0" -L http://dlib.net/license.html -d "a modern C++ toolkit containing machine learning algorithms and tools for creating complex software in C++ to solve real world problems"
    ./makeroom_dlib_19.23.sh 
    source /sw/libs/dlib/SOURCEME_dlib_19.23 && cd $SRCDIR
    wget https://github.com/davisking/dlib/archive/refs/tags/v19.23.tar.gz
    tar xf v19.23.tar.gz 

    ml cmake/3.22.2
    ml gcc/10.3.0

Needed to create a pkgconfig directory in ATLAS, and one for cblas and lapack as well.

    ml ATLAS/3.10.3
    ml zlib/1.2.11

Now prepare for building.

    cd dlib-19.23/

Change policy for the project to use `ZLIB_ROOT` environment variable to find that library. 

    vi CMakeLists.txt

Add the line `set(CMAKE_POLICY_DEFAULT_CMP0074 NEW)` near the top of the file.

    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX

Make sure it finds cblas and lapack using pkg-config.

Build.

    make -j10
    make install

