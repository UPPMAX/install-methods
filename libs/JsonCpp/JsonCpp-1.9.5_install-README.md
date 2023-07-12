JsonCpp/1.9.5
========================

<https://github.com/open-source-parsers/jsoncpp>

Used under license:
Dual Public Domain/MIT
<https://raw.githubusercontent.com/open-source-parsers/jsoncpp/master/LICENSE>

Structure creating script (makeroom_JsonCpp_1.9.5.sh) moved to /sw/libs/JsonCpp/makeroom_1.9.5.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-c" "libs" "-t" "JsonCpp" "-v" "1.9.5" "-w" "https://github.com/open-source-parsers/jsoncpp" "-l" "Dual Public Domain/MIT" "-L" "https://raw.githubusercontent.com/open-source-parsers/jsoncpp/master/LICENSE" "-d" "A C++ library for interacting with JSON"

    ./makeroom_JsonCpp_1.9.5.sh 
    source /sw/libs/JsonCpp/SOURCEME_JsonCpp_1.9.5
    cd $SRCDIR

    ml gcc/13.1.0  # 10.3.0 caused build errors about undefined operator delete: nothing in the issues tab
    ml doxygen/1.9.6
    ml meson/1.1.0
    ml ninja/1.10.0
    wget https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/1.9.5.tar.gz
    tar xf 1.9.5.tar.gz 
    cd jsoncpp-1.9.5/

Build both shared and static libraries. Note this pickes up python/3.8.7 without loading that module, apparently configured into meson?

    LIB_TYPE=shared
    meson setup --prefix $PREFIX --buildtype release --default-library $LIB_TYPE . build-$LIB_TYPE
    ninja -v -C build-${LIB_TYPE} test
    ninja -v -C build-${LIB_TYPE} install

    LIB_TYPE=static
    meson setup --prefix $PREFIX --buildtype release --default-library $LIB_TYPE . build-$LIB_TYPE
    ninja -v -C build-${LIB_TYPE} test
    ninja -v -C build-${LIB_TYPE} install

    cd $PREFIX
    ln -s lib64 lib

Adjust mf file, only `include/` and `lib64` under prefix.

    cd ../../mf
    vi 1.9.5 
