newick_utils/20160403
====================

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca snowy"
    VERSION=20160413
    TOOL=/sw/bioinfo/newick_utils
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget https://codeload.github.com/tjunier/newick_utils/zip/master
    unzip master
    cd newick_utils-master
    autoreconf -fi
    ./configure --prefix=$TOOL/$VERSION/$CLUSTER
    make
    make install
    cd ..
    rm -rf newick_utils-master

    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done

    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION
