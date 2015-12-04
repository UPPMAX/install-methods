# MUMmer-3.23-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    MUMmer 3.23

DESCRIPTION
-----------

    MUMmer 3.23 alignment tool

WEBSITE
-------

    http://mummer.sourceforge.net/

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/MUMmer/3.23/milou to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/MUMmer
    VERSION=3.23
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSION
    mkdir src
    cd src
    wget http://downloads.sourceforge.net/project/mummer/mummer/3.23/MUMmer3.23.tar.gz
    tar xvzf MUMmer3.23.tar.gz
    cd MUMmer3.23
    make CXXFLAGS="-O3 -DSIXTYFOURBITS" CFLAGS="-O3 -DSIXTYFOURBITS"
    mv * ../../milou/
    cd ..
    rmdir MUMmer3.23

Do the same for tintin.

Copy the mf from /sw/mf/common/bioinfo-tools/alignment/MUMmer/3.22.  No changes necessary

