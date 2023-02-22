JasPer/4.0.0
============

<https://github.com/mdadams/jasper>

Used under license:
Custom open-source AS IS
<https://raw.githubusercontent.com/jasper-software/jasper/master/LICENSE.txt>

Structure creating script (makeroom_JasPer_4.0.0.sh) moved to /sw/libs/JasPer/makeroom_4.0.0.sh

LOG
---

    makeroom.sh -f -t JasPer -v 4.0.0 -c libs -w https://github.com/mdadams/jasper -l "Custom open-source AS IS" -L https://raw.githubusercontent.com/jasper-software/jasper/master/LICENSE.txt -d "a library and application programs for the coding and manipulation of images"

    ./makeroom_JasPer_4.0.0.sh 

    source /sw/libs/JasPer/SOURCEME_JasPer_4.0.0
    cd $SRCDIR

    module load cmake/3.22.2
    module load texlive/2022-09-18
    module load doxygen/1.9.6

    wget https://github.com/jasper-software/jasper/archive/refs/tags/version-4.0.0.tar.gz

    tar xf version-4.0.0.tar.gz 

    cd jasper-version-4.0.0/
    mkdir cmakebuilddir
    cd cmakebuilddir

Build shared library.

    cmake -G "Unix Makefiles" .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_SHARED=true -DJAS_ENABLE_DOC=true -DCMAKE_BUILD_TYPE=Release
    make
    make install

Build static library.

    cmake -G "Unix Makefiles" .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_SHARED=false -DJAS_ENABLE_DOC=true -DCMAKE_BUILD_TYPE=Release
    make
    make install
