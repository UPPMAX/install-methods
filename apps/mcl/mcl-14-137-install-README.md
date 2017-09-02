mcl/14-137
==========

<https://micans.org/mcl/index.html>

LOG
---

    VERSION=14-137
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/mcl
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f mcl-${VERSION}.tar.gz ]] || wget https://micans.org/mcl/src/mcl-${VERSION}.tar.gz
    tar xzf mcl-${VERSION}.tar.gz
    mv mcl-${VERSION} mcl-${VERSION}-${CLUSTER}
    cd mcl-${VERSION}-${CLUSTER}
    module load gcc/4.9.2
    ./configure --prefix=$PFX
    make install

