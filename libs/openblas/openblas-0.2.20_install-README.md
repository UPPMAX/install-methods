openblas/0.2.20
===============

<https://github.com/xianyi/OpenBLAS>

LOG
---

    TOOL=/sw/libs/openblas
    VERSION=0.2.20
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/
    rm -rf OpenBLAS-$VERSION
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/xianyi/OpenBLAS/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd OpenBLAS-$VERSION
    module load gcc/6.3.0
    make clean
    [[ $CLUSTER = rackham ]] && NUM_CORES=20 || NUM_CORES=16
    make NUM_CORES=$NUM_CORES
    make NUM_CORES=$NUM_CORES PREFIX=$PFX install
    cd ..
    rm -rf OpenBLAS-$VERSION


