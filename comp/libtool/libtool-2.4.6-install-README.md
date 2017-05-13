libtool/2.4.6
=============

<https://www.gnu.org/software/libtool/>

LOG
---

Must use a more recent `m4` than is the milou system one.  Rackham has 1.4.16
which is OK but the m4/1.4.17 module is also available there so load it anyway.
Compile with the system gcc.

    cd /sw/comp
    cd libtool/
    VERSION=2.4.6
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget http://ftpmirror.gnu.org/libtool/libtool-${VERSION}.tar.gz
    tar xvzf libtool-${VERSION}.tar.gz 
    cd libtool-$VERSION
    module load m4/1.4.17
    ./configure --prefix=$PFX
    make -j4
    make install
