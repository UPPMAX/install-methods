# FLASH-1.2.11-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    FLASH 1.2.11

DESCRIPTION
-----------

    FLASH read joining tool

    Magoc T and Salzberg S.  2011.  FLASH: Fast length adjustment of short 
    reads to improve genome assemblies. Bioinformatics 27: 2957-63.

WEBSITE
-------

    http://ccb.jhu.edu/software/FLASH/

MODULE REQUIREMENTS
-------------------

    None

LOG
---

    TOOL=/sw/apps/bioinfo/FLASH
    VERSION=1.2.11
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir mf
    cd $TOOLDIR
    mkdir src
    cd src
    wget http://downloads.sourceforge.net/project/flashpage/FLASH-1.2.11.tar.gz
    tar xvzf FLASH-1.2.11.tar.gz 
    cd FLASH-1.2.11/
    make
    cd $CLUSTERDIR
    cp ../src/FLASH-1.2.11/flash .

Steal an mf from another project, we need to add $CLUSTERDIR/bin to PATH and load boost/1.55.0.

    cd $TOOL/mf
    cp /sw/apps/bioinfo/BEETL/mf/1.0.2 1.2.11
    vi 1.2.11

Repeat for tintin...

    ssh tintin
    CLUSTER=tintin
    ... etc ...

Be a good neighbor.

    cd /sw/apps/bioinfo
    chgrp -hR sw FLASH
    chmod -R g+w,o+r FLASH
