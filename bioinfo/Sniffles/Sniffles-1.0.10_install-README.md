Sniffles/1.0.10
===============

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="snowy irma bianca"
    VERSION=1.0.10
    TOOL=/sw/apps/bioinfo/Sniffles
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION/src
    wget https://github.com/fritzsedlazeck/Sniffles/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    cd Sniffles-$VERSION
    mkdir -p build
    cd build
    cmake ..
    make
    cd ../
    mv bin/sniffles-* $TOOL/$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
