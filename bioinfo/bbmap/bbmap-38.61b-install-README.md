bbmap/38.61b
===========

<https://sourceforge.net/projects/bbmap/>

<https://jgi.doe.gov/data-and-tools/bbtools>

LOG
---

    VERSION=38.61b
    TOOL=/sw/bioinfo/bbmap
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    # don't actually create the $CLUSTER directory, the unpacked directory will become that
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://downloads.sourceforge.net/project/bbmap/BBMap_${VERSION}.tar.gz
    tar xzf BBMap_$VERSION.tar.gz
    mv bbmap $PFX


