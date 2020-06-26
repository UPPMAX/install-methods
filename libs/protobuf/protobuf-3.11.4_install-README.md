protobuf/3.11.4
========================

<https://github.com/protocolbuffers/protobuf>

Used under license:


Structure creating script (makeroom_protobuf_3.11.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/protobuf/makeroom_3.11.4.sh

LOG
---

    TOOL=protobuf
    VERSION=3.11.4
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER


    cd $VERSIONDIR/src
    wget https://github.com/protocolbuffers/protobuf/archive/v3.11.4.tar.gz
    tar xfvz v3.11.4.tar.gz --strip 1
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make -j 10
    make install


    
