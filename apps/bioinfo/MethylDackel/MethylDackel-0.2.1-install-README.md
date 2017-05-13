MethylDackel/0.2.1
==================

Renamed from PileOMeth.

<https://github.com/dpryan79/MethylDackel>

LOG
---

    VERSION=0.2.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir MethylDackel
    cd MethylDackel/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/dpryan79/MethylDackel/archive/${VERSION}.tar.gz
    tar xzf $VERSION.tar.gz
    mv MethylDackel-$VERSION MethylDackel-${VERSION}_$CLUSTER
    cd MethylDackel-${VERSION}_$CLUSTER
    module load gcc/5.4.0
    make
    make install prefix=$PFX
    ldd $PFX/MethylDackel

Just C-language shared libraries.  Can use the mf from PileOMeth.

