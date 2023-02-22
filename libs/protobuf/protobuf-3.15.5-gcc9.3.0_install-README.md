protobuf/3.15.5-gcc9.3.0
========================

<https://github.com/protocolbuffers/protobuf>

Used under license:
Google open-source AS IS
<https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE>

Structure creating script (makeroom_protobuf_3.15.5.sh) moved to /sw/libs/protobuf/makeroom_3.15.5.sh

Compiled with module gcc/9.3.0

LOG
---

    TOOL=protobuf
    TOOLVERSION=3.15.5
    COMPVERSION=gcc9.3.0
    VERSION="${TOOLVERSION}-${COMPVERSION}"
    cd /sw/libs
    makeroom.sh -f -c libs -t "protobuf" -v "${VERSION}" -w "https://github.com/protocolbuffers/protobuf" -d "Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data; compiled with gcc/9.3.0" -l "Google open-source AS IS" -L "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE"
    ./makeroom_protobuf_${VERSION}.sh 
    source SOURCEME_protobuf_${VERSION} 
    vi protobuf-${VERSION}_post-install.sh
    cd ${VERSION}/
    cd src/
    wget https://github.com/protocolbuffers/protobuf/archive/v${TOOLVERSION}.tar.gz
    tar xf v${TOOLVERSION}.tar.gz 
    cd protobuf-${TOOLVERSION}/
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make -j10
    make install


