openblas/0.2.20-singlethread
============================

<https://github.com/xianyi/OpenBLAS>

LOG
---

    TOOL=/sw/libs/openblas
    TOOLVERSION=0.2.20
    VERSION=0.2.20-singlethread
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/
    rm -rf OpenBLAS-$TOOLVERSION
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/xianyi/OpenBLAS/archive/v${TOOLVERSION}.tar.gz
    tar xzf v${TOOLVERSION}.tar.gz
    cd OpenBLAS-$TOOLVERSION
    module load gcc/6.3.0
    make clean
    make USE_THREAD=0
    make USE_THREAD=0 PREFIX=$PFX install
    cd ..
    rm -rf OpenBLAS-$TOOLVERSION


