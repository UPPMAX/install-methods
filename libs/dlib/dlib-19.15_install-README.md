dlib/19.15
==========

LOG
---

    VERSION=19.15
    TOOL=/sw/libs/DLIB
    mkdir -p $TOOL/{$VERSION,src}
    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    cd $TOOL/src
    wget https://github.com/davisking/dlib/archive/v19.15.tar.gz
    tar xf v19.15.tar.gz
    mv dlib-$VERSION ../$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
