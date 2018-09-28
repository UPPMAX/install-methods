    VERSION=4.0.5
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    OTHERCLUSTERS="irma bianca"
    TOOL=/sw/apps/bioinfo/snippy
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget https://github.com/tseemann/snippy/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    mv snippy-$VERSION ../$VERSION/$CLUSTER
    rm -rf snippy-$VERSION
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    
