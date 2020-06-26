subversion/1.10.6
========================

<https://subversion.apache.org/>

Used under license:
Apache License Version 2.0

Structure creating script (makeroom_subversion_1.10.6.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/subversion/makeroom_1.10.6.sh

LOG
---

    TOOL=subversion
    VERSION=1.10.6
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER   

module load apr/1.7.0
module load apr-util/1.6.1
module load sqlite/3.24.0
module load lz4/1.9.2
module load utf8proc/2.5.0 

mkdir $PREFIX/src
cd $PREFIX/src

wget https://downloads.apache.org/subversion/subversion-1.10.6.tar.gz
tar xfvz subversion-1.10.6.tar.gz --strip 1
./configure --prefix=$PREFIX

make -j 20
make install
