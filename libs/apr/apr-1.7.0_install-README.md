apr/1.7.0
========================

<https://github.com/apache/apr>

Used under license:
Apache License 2.0

Structure creating script (makeroom_apr_1.7.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/apr/makeroom_1.7.0.sh

LOG
---

    TOOL=apr
    VERSION=1.7.0
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER

# Installera apr innan apr-utils
module load gcc/9.3.0
source $TOOLDIR/SOURCEME_apr_1.7.0
cd $PREFIX

wget https://github.com/apache/apr/archive/1.7.0.tar.g
mv 1.7.0.tar.gz apr-1.7.0.tar.gz
tar xfvz apr-1.7.0.tar.gz
cd $PREFIX/apr-1.7.0
./buildconf 
touch libtoolT #A wierd bug. See https://stackoverflow.com/questions/18091991/error-while-compiling-apache-apr-make-file-not-found
./configure --prefix=$PREFIX/prefix 
make -j 8
make install
