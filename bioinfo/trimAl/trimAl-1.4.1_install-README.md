trimAl/1.4.1
============

<https://github.com/scapella/trimal>


1.4.1 is the most recent, from 2015

LOG
---

    TOOL=/sw/bioinfo/trimAl
    VERSION=1.4.1
    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca snowy"

    mkdir -p $TOOL/$VERSION/{$CLUSTER,src}
    cd $TOOL/$VERSION/src
    wget https://github.com/scapella/trimal/archive/v$VERSION.tar.gz
    tar xf *.tar.gz
    cd trimal-$VERSION/source
    make
    for f in "readal trimal statal"; do
        cp $f $TOOL/$VERSION/$CLUSTER
    done
    cd $TOOL/$VERSION
    for C in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $C
    done
