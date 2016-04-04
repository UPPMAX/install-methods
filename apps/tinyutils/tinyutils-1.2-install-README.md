# tinyutils-1.2-install-README.md

TITLE
=====

    tinyutils 1.2

DESCRIPTION
-----------

    Collection of small awk utilities for operating on columns of numbers.

WEBSITE
-------

    https://github.com/douglasgscofield/tinyutils

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/tinyutils/1.2/tinyutils to the user PATH.

LOG
---

    TOOL=/sw/apps/tinyutils
    VERSION=1.2
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir milou src
    ln -s ./milou tintin
    ln -s ./milou nestor
    ln -s ./milou irma
    ln -s ./milou halvan
    cd src
    git clone https://github.com/douglasgscofield/tinyutils
    cd tinyutils
    rm -rf .git*
    mv * ../../milou
    cd ..
    rmdir tinyutils

Use same mf as 1.1.
