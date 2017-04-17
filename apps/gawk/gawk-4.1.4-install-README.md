gawk 4.1.4
==========

<https://www.gnu.org/software/gawk/>

LOG
---

    VERSION=4.1.4
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/
    mkdir gawk
    cd gawk
    mkdir $VERSION
    cd $VERSION
    mkdir src_$CLUSTER $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src_$CLUSTER/
    wget http://ftp.gnu.org/gnu/gawk/gawk-${VERSION}.tar.xz
    tar xJvf gawk-${VERSION}.tar.xz 
    cd gawk-${VERSION}/
    ./configure --with-gnu-ld --prefix=$P
    make 
    make install
    cd $P

Lots of stuff provides.  Should probably borrow mf from coreutils.

