AdapterRemoval/2.2.2
====================

<https://github.com/MikkelSchubert/adapterremoval>

LOG
---

    TOOL=/sw/apps/bioinfo/AdapterRemoval
    VERSION=2.2.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    module load git/2.10.2
    module load gcc/6.3.0
    module load zlib/1.2.11 
    module load bzip2/1.0.6
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/MikkelSchubert/adapterremoval/archive/v${VERSION}.tar.gz
    rm -rf adapterremoval-$VERSION
    tar xzf v${VERSION}.tar.gz
    cd adapterremoval-$VERSION
    make QUIET_BUILD=no COLOR_BUILD=no
    make QUIET_BUILD=no COLOR_BUILD=no PREFIX=$PFX install
    cd ..
    rm -rf adapterremoval-$VERSION
