# ucsc-utilities-v287-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

UCSC Utilities v287

DESCRIPTION
-----------

Various useful utilities from UCSC

WEBSITE
-------

    http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/

MODULE REQUIREMENTS
-------------------

Just add the PATH

LOG
---

    UCSC_DIR=/sw/apps/bioinfo/ucsc-utilities
    VERSION=v287
    mkdir -p $UCSC_DIR/$VERSION/milou
    cd $UCSC_DIR/$VERSION/milou
    # download them all from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v287/
    cd $UCSC_DIR/$VERSION
    ln -s milou tintin

Create mf file and have it add $UCSC_DIR/$VERSION/milou to the user PATH.


