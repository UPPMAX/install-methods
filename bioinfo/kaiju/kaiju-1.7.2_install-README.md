kaiju/1.6.2
===========

LOG
---

    SWROOT=/sw/bioinfo
    TOOL=kaiju
    VERSION=1.7.2
    CLUSTER=rackham
    OTHERCLUSTER="snowy bianca irma"

    mkdir -p $SWROOT/$TOOL/$VERSION $SWROOT/$TOOL/$VERSION/src

    cd $SWROOT/$TOOL/$VERSION/src
    wget https://github.com/bioinformatics-centre/kaiju/releases/download/v${VERSION}/kaiju-${VERSION}-linux-x86_64.tar.gz
    tar xf $TOOL-$VERSION-linux-x86_64.tar.gz
    mv $TOOL-v${VERSION}-linux-x86_64-static $SWROOT/$TOOL/$TOOL/$VERSION/$CLUSTER

    cd $SWROOT/$TOOL/$VERSION
    for c in $OTHERCLUSTER; do
      ln -fs $CLUSTER $c
    done

    fixup $SWROOT/$TOOL

