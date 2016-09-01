# ucsc-utilities-v334-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

UCSC Utilities v334


DESCRIPTION
-----------

Various useful utilities from UCSC.  Infer the version from the last source bundle.


WEBSITE
-------

    http://hgdownload.cse.ucsc.edu/admin/exe/


MODULE REQUIREMENTS
-------------------

Just add the PATH


LOG
---

    UCSC_DIR=/sw/apps/bioinfo/ucsc-utilities
    VERSION=v334
    mkdir -p $UCSC_DIR/$VERSION/milou
    cd $UCSC_DIR/$VERSION/milou

Download them all from http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/

    rsync -aP rsync://hgdownload.cse.ucsc.edu/genome/admin/exe/linux.x86_64/ ./

Same executables for both systems.

    cd $UCSC_DIR/$VERSION
    ln -s milou tintin

Fix permissions.

    cd $UCSC_DIR/$VERSION
    fixup -g .

Create mf file and have it add $UCSC_DIR/$VERSION/milou to the user PATH.

