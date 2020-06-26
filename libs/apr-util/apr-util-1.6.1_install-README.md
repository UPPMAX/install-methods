apr-util/1.6.1
========================

<https://apr.apache.org/>

Used under license:
Apache License Version 2.0

Structure creating script (makeroom_apr-util_1.6.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/apr-util/makeroom_1.6.1.sh

LOG
---

    TOOL=apr-util
    VERSION=1.6.1
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER

# Installera apr innan apr-utils
source $TOOLDIR/SOURCEME_apr-util_1.6.1 
mkdir $PREFIX/src
cd $PREFIX/src
wget https://downloads.apache.org//apr/apr-util-1.6.1.tar.gz
tar xfvz apr-util-1.6.1.tar.gz
cd apr-util-1.6.1/
./configure --prefix=$PREFIX --with-apr=/sw/libs/apr/1.7.0/rackham/apr-1.7.0
make 
make install
