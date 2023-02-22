OpenJPEG/2.5.0
==============

<https://www.openjpeg.org/>

Used under license:
BSD 2-clause
<https://raw.githubusercontent.com/uclouvain/openjpeg/master/LICENSE>

Structure creating script (makeroom_OpenJPEG_2.5.0.sh) moved to /sw/libs/OpenJPEG/makeroom_2.5.0.sh

LOG
---

The previous 2.3.0 was probably provided by downloaded the linux x86_64 bundle.
That is not possible as the C library required is newer than the one we have on
CentOS 7. We build from source, both static and shared libraries.


    makeroom.sh "-f" "-t" "OpenJPEG" "-v" "2.5.0" "-c" "libs" "-w" "https://www.openjpeg.org/" "-l" "BSD 2-clause" "-L" "https://raw.githubusercontent.com/uclouvain/openjpeg/master/LICENSE" "-d" "open-source JPEG 2000 codec"

    ./makeroom_OpenJPEG_2.5.0.sh

    source /sw/libs/OpenJPEG/SOURCEME_OpenJPEG_2.5.0
    cd $SRCDIR

    wget https://github.com/uclouvain/openjpeg/archive/refs/tags/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz 
    cd openjpeg-${VERSION}/

A cmake build environment, see https://github.com/uclouvain/openjpeg/blob/master/INSTALL.md

    module load cmake/3.22.2
    module load gcc/10.3.0
    module load doxygen/1.9.6
    module load libtiff/4.5.0
    module load zlib/1.2.12

    mkdir build
    cd build

    cmake -DCMAKE_C_FLAGS="-O3 -msse4.1 -DNDEBUG" .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS:bool=off  -DCMAKE_POLICY_DEFAULT_CMP0074=NEW  -DTIFF_INCLUDE_DIR:PATH=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so
    make -j 10
    make install

Shared libraries.

    rm -rf *
    cmake -DCMAKE_C_FLAGS="-O3 -msse4.1 -DNDEBUG" .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS:bool=on  -DCMAKE_POLICY_DEFAULT_CMP0074=NEW  -DTIFF_INCLUDE_DIR:PATH=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so
    make -j 10
    make install
