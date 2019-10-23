kaiju-1.6.2
===========

LOG
---

    SWROOT=/sw/bioinfo
    TOOL=kaiju
    VERSION=1.6.2
    CLUSTER=rackham
    OTHERCLUSTER="snowy bianca irma"

    mkdir -p $SWROOT/$TOOL/$VERSION $SWROOT/$TOOL/src

    cd $SWROOT/$TOOL/src
    wget https://github.com/bioinformatics-centre/kaiju/releases/download/v1.6.2/kaiju-1.6.2-linux-x86_64.tar.gz
    tar xf $TOOL-$VERSION-linux-x86_64.tar.gz
    mv kaiju-v1.6.2-linux-x86_64-static ../$VERSION/$CLUSTER

    cd $SWROOT/$TOOL/$VERSION
    for c in $OTHERCLUSTER; do
      ln -fs $CLUSTER $c
    done

    chgrp sw -R $SWROOT/$TOOL
    chmod g+rwx -R $SWROOT/$TOOL
