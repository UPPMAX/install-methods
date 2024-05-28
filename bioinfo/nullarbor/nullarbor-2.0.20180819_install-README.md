nullarbor/2.0.20180819
======================

Installed before official release, hence from master branch

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=2.0.20180819
    TOOL=/sw/apps/bioinfo/nullarbor
    mkdir -p $TOOL/$VERSION $TOOL/src
    cd $TOOL/src
    wget https://codeload.github.com/tseemann/nullarbor/zip/master
    unzip master
    mv nullarbor-master ../$VERSION/$CLUSTER
    cd ..
    rm -rf nullarbor-master
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION
