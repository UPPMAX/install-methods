bbmap/37.53
===========

<https://jgi.doe.gov/data-and-tools/bbtools>

LOG
---

    VERSION=37.53
    TOOL=/sw/apps/bioinfo/bbmap
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://downloads.sourceforge.net/project/bbmap/BBMap_${VERSION}.tar.gz
    tar xzf BBMap_$VERSION.tar.gz
    mv bbmap ../$CLUSTER
    cd ..
    for C in rackham irma bianca ; do rm -f $C && ln -sf milou $C; done

