ncftp/3.2.6
===========

LOG
---

    TOOL=/sw/apps/ncftp
    VERSION=3.2.6
    CLUSTER=rackham
    OTHERCLUSTERS="irma snowy bianca"

    mkdir -p $TOOL/{src,$VERSION}
    cd $TOOL/src
    #wget ftp://ftp.ncftp.com/ncftp/binaries/ncftp-$VERSION-linux-x86_64-glibc2.17-export.tar.gz
    wget ftp://ftp.ncftp.com/ncftp/ncftp-3.2.6-src.tar.gz
    tar xf ncftp-$VERSION-src.tar.gz
    cd ncftp-$VERSION
    ./configure --prefix=$TOOL/$VERSION/$CLUSTER --mandir=$TOOL/$VERSION/$CLUSTER/man
    make && make install
    cd ../../$VERSION
    for c in $OTHERCLUSTERS; do
       ln -fs $CLUSTER $c
    done
