mesos/1.9.0
========================

<http://mesos.apache.org/>

Used under license:
Apache-2.0

Structure creating script (makeroom_mesos_1.9.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/mesos/makeroom_1.9.0.sh

LOG
---

    TOOL=mesos
    VERSION=1.9.0
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    boost_path=/sw/libs/boost/1.66.0/

    module load gcc/9.3.0
    module load apr/1.7.0
    module load maven/3.6.0
    module load cyrus-sasl/2.1.27
    module load subversion/1.10.6

    mkdir $PREFIX/src
    cd $PREFIX/src
    wget http://archive.apache.org/dist/mesos/1.9.0/mesos-1.9.0.tar.gz
    tar xfvz mesos-1.9.0.tar.gz --strip 1
    mkdir build
    cd build
    ../configure --prefix=$PREFIX --with-boost=$boost_path
    make -j 40
    make install

