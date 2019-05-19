star-fusion/1.0.0
=================

<https://github.com/STAR-Fusion/STAR-Fusion>


LOG
---

    VERSION=1.0.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/star-fusion
    cd /sw/apps/bioinfo/star-fusion
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd src
    wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/v${VERSION}/STAR-Fusion-v${VERSION}.FULL.tar.gz
    tar -xvf STAR-Fusion-v${VERSION}.FULL.tar.gz
    cp -av STAR-Fusion-v${VERSION}/* ../$CLUSTER/
    cd ..

Now make links for the other clusters.

In the mf file, load `star/2.5.3a` if a star is not already loaded, and load the most recent perl with perl_modules.



