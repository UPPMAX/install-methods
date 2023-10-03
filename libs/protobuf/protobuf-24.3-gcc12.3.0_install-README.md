protobuf/24.3-gcc12.3.0
========================

<https://github.com/protocolbuffers/protobuf>

Used under license:
Google open-source AS IS
<https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE>

Structure creating script (makeroom_protobuf_24.3-gcc12.3.0.sh) moved to /sw/libs/protobuf/makeroom_24.3-gcc12.3.0.sh

Build with cmake/3.26.3, with module gcc/10.3.0 and binutils/2.38. binutils
must be loaded, it won't link with the system ld (2.27) because the link grows
up to at least 3.1T with LTO.

We also want the libraries, etc., so the bazel build is not such a clear way
forward. It also needs the later binutils to be loaded.

LOG
---

    TOOL=protobuf
    TOOLVERSION=24.3
    GCCVERSION=12.3.0
    BINUTILSVERSION=2.38
    VERSION="${TOOLVERSION}-gcc${GCCVERSION}"

    makeroom.sh -f -c libs -t "protobuf" -v "${VERSION}" -w "https://github.com/protocolbuffers/protobuf" -d "Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data; compiled with gcc/10.3.0" -l "Google open-source AS IS" -L "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE"
    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/libs/protobuf/SOURCEME_protobuf_24.3-gcc12.3.0
    cd $SRCDIR

    ml git/2.34.1
    ml gcc/$GCCVERSION
    ml binutils/$BINUTILSVERSION
    ml zlib/1.2.12
    ml python/3.10.8

    git clone --recursive https://github.com/protocolbuffers/protobuf
    cd protobuf/
    git reset --hard v24.3
    mkdir build
    cd build

Static libraries.

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -Dprotobuf_BUILD_LIBPROTOC:BOOL=ON 
    make -j10
    make test
    make install

Shared libraries.

    rm -rf *  # within build/
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -Dprotobuf_BUILD_LIBPROTOC:BOOL=ON -Dprotobuf_BUILD_SHARED_LIBS:BOOL=ON
    make -j10
    make test
    make install

Wrap up.

    cd $TOOLDIR
    ./protobuf-24.3-gcc12.3.0_post-install.sh
