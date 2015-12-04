# cnD-1.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    cnD 1.3

DESCRIPTION
-----------

    cnD 1.3

    Simpson JT, McIntyre RE, Adams DJ and Durbin R. 2010.  Copy number variant
    detection in inbred strains from short read sequence data.  Bioinformatics
    26(4):565-567.

WEBSITE
-------

    http://www.sanger.ac.uk/resources/software/cnd/

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/cnD/1.3/$CLUSTER/bin to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/cnD
    VERSION=1.3
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    wget ftp://ftp.sanger.ac.uk/pub/resources/software/cnd/cnD-1.3.tar.gz
    tar xzf cnD-$VERSION.tar.gz
    cd cnD
    # using pre-compiled binaries
    cp -av bin $CLUSTERDIR/
    # download the manual
    cd $CLUSTERDIR/bin
    wget ftp://ftp.sanger.ac.uk/pub/resources/software/cnd/readme.txt

Since precompiled binaries are being used, we just link all systems to
the milou directory.

