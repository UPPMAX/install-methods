abricate/0.8.7
==============

<https://github.com/tseemann/abricate>

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=0.8.7
    TOOL=/sw/apps/bioinfo/abricate
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget https://github.com/tseemann/abricate/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    mv abricate-$VERSION ../$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION

