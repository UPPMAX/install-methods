Kraken/1.1.1
============

<https://github.com/DerrickWood/kraken>

Installing 1.1.1 which updates the databases to be downloaded.

LOG
---

    TOOL=/sw/bioinfo/Kraken
    VERSION=1.1.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget --timestamping https://github.com/DerrickWood/kraken/archive/v${VERSION}.tar.gz
    [[ -d kraken-$VERSION ]] && rm -rf kraken-$VERSION
    tar xzf v${VERSION}.tar.gz
    cd kraken-$VERSION
    module load gcc/8.3.0
    ./install_kraken.sh $PFX
    cd ..
    [[ -d kraken-$VERSION ]] && rm -rf kraken-$VERSION

