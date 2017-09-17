AdapterRemoval/2.1.7
====================

<https://github.com/MikkelSchubert/adapterremoval>

LOG
---

    TOOL=/sw/apps/bioinfo/AdapterRemoval
    VERSION=2.1.7
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    module load git/2.10.2
    module load gcc/4.9.2
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/MikkelSchubert/adapterremoval/archive/v${VERSION}.tar.gz
    rm -rf adapterremoval-$VERSION
    tar xzf v${VERSION}.tar.gz
    cd adapterremoval-$VERSION
    make ENABLE_QUIET_BUILD=no ENABLE_COLOR_BUILD=no
    make ENABLE_QUIET_BUILD=no ENABLE_COLOR_BUILD=no PREFIX=$PFX install
    cd ..
    rm -rf adapterremoval-$VERSION
