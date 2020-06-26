utf8proc/2.5.0
========================

<https://github.com/JuliaStrings/utf8proc>

Used under license:
MIT

Structure creating script (makeroom_utf8proc_2.5.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/utf8proc/makeroom_2.5.0.sh

LOG
---

    TOOL=utf8proc
    VERSION=2.5.0
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER


mkdir $PREFIX/src
cd $PREFIX/src
wget https://github.com/JuliaStrings/utf8proc/archive/v2.5.0.tar.gz -O utf8proc-2.5.0.tar.gz
tar xfvz utf8proc-2.5.0.tar.gz --strip 1
make
make install prefix=$PREFIX



