# BEDOPS-2.4.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

BEDOPS 2.4.3

DESCRIPTION
-----------

BEDOPS high-performance genomic feature operations

WEBSITE
-------

    https://github.com/bedops/bedops

MODULE REQUIREMENTS
-------------------

Downloaded Linux x86_64 binaries.

LOG
---

    CLUSTER=milou
    TOOLDIR=/sw/apps/bioinfo/BEDOPS
    VERSION=2.4.3
    VDIR=$TOOLDIR/$VERSION
    mkdir -p $VDIR
    cd $VDIR
    mkdir -p $CLUSTER
    CLUSTERDIR=$VDIR/$CLUSTER
    ln -s ./$CLUSTER halvan
    ln -s ./$CLUSTER nestor
    ln -s ./$CLUSTER tintin
    SOURCEDIR=$VDIR/src
    mkdir -p $SOURCEDIR
    cd $SOURCEDIR
    wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
    tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
    mv bin $CLUSTERDIR/

Copy and edit mf file named $VERSION which simply adds $CLUSTERDIR/bin to user PATH.

    mkdir -p /sw/mf/common/bioinfo-tools/sw_collections/BEDOPS
    cd /sw/mf/common/bioinfo-tools/sw_collections/BEDOPS
    cp $TOOLDIR/mf/$VERSION $VERSION
    chgrp -h sw $VERSION
    mkdir -p /sw/mf/milou/bioinfo-tools/sw_collections/BEDOPS
    cd /sw/mf/milou/bioinfo-tools/sw_collections/BEDOPS
    ln -sf ../../../../common/bioinfo-tools/sw_collections/BEDOPS/$VERSION .
    chgrp -h sw $VERSION

    mkdir -p /sw/mf/tintin/bioinfo-tools/sw_collections/BEDOPS
    cd /sw/mf/tintin/bioinfo-tools/sw_collections/BEDOPS
    ln -sf ../../../../common/bioinfo-tools/sw_collections/BEDOPS/$VERSION .
    chgrp -h sw $VERSION

Be a nice sw group member.

    cd $VDIR
    chgrp -R sw *
    chmod -R g+w,o-w *
    find . -type d -exec chmod g+s,o+rx {} \;

