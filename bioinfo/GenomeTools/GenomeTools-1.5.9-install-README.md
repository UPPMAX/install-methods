GenomeTools/1.4.9
=================

<http://genometools.org>

Log
---


    CLUSTER=rackham
    TOOL=/sw/apps/bioinfo/GenomeTools
    VERSION=1.5.9
    OTHERCLUSTERS="irma bianca"

    mkdir -p $TOOL/$VERSION/$CLUSTER $TOOL/src

    cd $TOOL/src
    wget http://genometools.org/pub/genometools-$VERSION.tar.gz
    tar xf genometools-$VERSION.tar.gz
    cd genometools-$VERSION
    make
    mv bin ../../$VERSION/$CLUSTER
    mv lib ../../$VERSION/$CLUSTER
    cd ..
    rm -rf genometools-$VERSION

    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done

    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION
