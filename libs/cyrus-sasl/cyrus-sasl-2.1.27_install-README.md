cyrus-sasl/2.1.27
========================

<https://github.com/cyrusimap/cyrus-sasl>

Used under license:


Structure creating script (makeroom_cyrus-sasl_2.1.27.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/cyrus-sasl/makeroom_2.1.27.sh

LOG
---

    TOOL=cyrus-sasl
    VERSION=2.1.27
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER

source $TOOLDIR/SOURCEME_cyrus-sasl_2.1.27
mkdir $PREFIX/src
cd $PREFIX/src

wget https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-2.1.27/cyrus-sasl-2.1.27.tar.gz
tar xfvz cyrus-sasl-2.1.27.tar.gz --strip 1

./configure --prefix=$PREFIX
make
make install

