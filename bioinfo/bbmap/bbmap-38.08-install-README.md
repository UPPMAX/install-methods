bbmap/38.08
===========

<https://jgi.doe.gov/data-and-tools/bbtools>

LOG
---

    VERSION=38.08
    TOOL=/sw/apps/bioinfo/bbmap
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://downloads.sourceforge.net/project/bbmap/BBMap_${VERSION}.tar.gz
    tar xzf BBMap_$VERSION.tar.gz
    mv bbmap $PFX


