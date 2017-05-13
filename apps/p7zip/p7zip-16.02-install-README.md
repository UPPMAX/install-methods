p7zip/16.02
===========

LOG
---

    VERSION=16.02
    CLUSTER+${CLUSTER:?CLUSTER must be set}
    cd /sw/apps
    mkdir p7zip
    cd p7zip/
    ls ..
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER
    cd $CLUSTER/
    PFX=$PWD
    cd ../
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget https://downloads.sourceforge.net/project/p7zip/p7zip/${VERSION}/p7zip_${VERSION}_src_all.tar.bz2
    tar xvjf p7zip_${VERSION}_src_all.tar.bz2 
    cd p7zip_${VERSION}/

The default makefile is OK here.

    module load gcc/5.4.0
    make
    make DEST_HOME=$PFX install


