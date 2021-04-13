protobuf/3.15.5
===============

<https://github.com/protocolbuffers/protobuf>

Used under license:
Google open-source AS IS
<https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE>

Structure creating script (makeroom_protobuf_3.15.5.sh) moved to /sw/libs/protobuf/makeroom_3.15.5.sh


Compiled with system gcc, at installation this is version 4.8.5.

LOG
---

TOOL=protobuf
TOOLVERSION=3.15.5
VERSION="${TOOLVERSION}"
cd /sw/libs
makeroom.sh -f -c libs -t "protobuf" -v "${VERSION}" -w "https://github.com/protocolbuffers/protobuf" -d "Protocol Buffers (a.k.a., protobuf) are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data" -l "Google open-source AS IS" -L "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/LICENSE"
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
