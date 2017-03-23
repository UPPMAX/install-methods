zlib 1.2.11
===========

<http://www.zlib.net/>

LOG
---

Note: zlib configure is not an autoconf configure.  Just compile with system gcc.

    cd /sw/libs/zlib/
    VERSION=1.2.11
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD    # for prefix
    cd src_$CLUSTER/
    wget http://www.zlib.net/zlib-${VERSION}.tar.gz
    tar xzf zlib-${VERSION}.tar.gz 
    cd zlib-${VERSION}/
    ./configure --prefix=$P
    make test
    make install

Now set up mf to point to a cluster.

    cd /sw/libs/zlib/mf
    cp 1.2.8 1.2.11
    vi 1.2.11

