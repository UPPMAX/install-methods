OpenBLAS 0.2.19
===============

<https://github.com/xianyi/OpenBLAS>

LOG
---

    cd /sw/libs/openblas
    VERSION=0.2.19
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/xianyi/OpenBLAS/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd OpenBLAS-$VERSION
    make -j 10
    make PREFIX=/sw/libs/openblas/$VERSION/$CLUSTER install
