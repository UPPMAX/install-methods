mlst/2.12
=========

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=2.12
    TOOL=/sw/apps/bioinfo/mlst
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget https://github.com/tseemann/mlst/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    mv mlst-$VERSION ../$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod -R g+rwx $TOOL/$VERSION
