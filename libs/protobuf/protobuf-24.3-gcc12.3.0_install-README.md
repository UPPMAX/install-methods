protobuf/24.3-gcc12.3.0
========================

<https://github.com/protocolbuffers/protobuf>

Used under license:
Google open-source AS IS
<https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE>

Structure creating script (makeroom_protobuf_24.3-gcc12.3.0.sh) moved to /sw/libs/protobuf/makeroom_24.3-gcc12.3.0.sh

Compiled with module gcc/10.3.0

LOG
---

    TOOL=protobuf
    TOOLVERSION=24.3
    GCCVERSION=12.3.0
    VERSION="${TOOLVERSION}-gcc${GCCVERSION}"
    cd /sw/libs/$TOOL

    makeroom.sh -f -c libs -t "protobuf" -v "${VERSION}" -w "https://github.com/protocolbuffers/protobuf" -d "Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data; compiled with gcc/10.3.0" -l "Google open-source AS IS" -L "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR

    wget https://github.com/protocolbuffers/protobuf/archive/v${TOOLVERSION}.tar.gz
    tar xf v${TOOLVERSION}.tar.gz 
    cd protobuf-${TOOLVERSION}/

    module load gcc/$GCCVERSION
    module load zlib/1.2.12
    module load java/OpenJDK_17+35  # don't know if this makes a difference yet

    ./autogen.sh
    ./configure --with-zlib --prefix=$PREFIX
    make -j10
    make check
    make install


protobuf/24.3-gcc12.3.0
========================

<https://github.com/protocolbuffers/protobuf>

Used under license:
Google open-source AS IS
<https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE>

Structure creating script (makeroom_protobuf_24.3-gcc12.3.0.sh) moved to /sw/libs/protobuf/makeroom_24.3-gcc12.3.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-c" "libs" "-t" "protobuf" "-v" "24.3-gcc12.3.0" "-w" "https://github.com/protocolbuffers/protobuf" "-d" "Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data; compiled with gcc/10.3.0" "-l" "Google open-source AS IS" "-L" "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE"
    ./makeroom_protobuf_24.3-gcc12.3.0.sh
