mash/2.0
========

LOG
---

    SWROOT=/sw/apps/bioinfo
    TOOL=mash
    VERSION=2.0
    CLUSTER=rackham
    OTHERCLUSTER="bianca irma"

    mkdir -p $SWROOT/$TOOL/$VERSION/$CLUSTER $SWROOT/$TOOL/src

    cd $SWROOT/$TOOL/src
    wget https://github.com/marbl/Mash/releases/download/v$VERSION/mash-Linux64-v$VERSION.tar
    tar xf mash-Linux64-v$VERSION.tar
    cp -a mash-Linux64-v$VERSION/mash ../$VERSION/$CLUSTER/

    cd $SWROOT/$TOOL/$VERSION
    for c in $OTHERCLUSTER; do
      ln -fs $CLUSTER $c
    done

    chgrp sw -R $SWROOT/$TOOL
    chmod g+rwx -R $SWROOT/$TOOL
