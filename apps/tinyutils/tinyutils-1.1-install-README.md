# tinyutils-1.1-install-README.md

TITLE
=====

    tinyutils 1.1

DESCRIPTION
-----------

    Collection of small awk utilities for operating on columns of numbers.

WEBSITE
-------

    https://github.com/douglasgscofield/tinyutils

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/tinyutils/1.1/tinyutils to the user PATH.

LOG
---

    TOOL=/sw/apps/tinyutils
    VERSION=1.1
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    git clone https://github.com/douglasgscofield/tinyutils

To update the local repository:

    TOOL=/sw/apps/tinyutils
    VERSION=default
    VERSIONDIR=$TOOL/$VERSION/tinyutils
    cd $VERSIONDIR
    git pull

If you are me and want to update the remote repository

    TOOL=/sw/apps/tinyutils
    VERSION=default
    VERSIONDIR=$TOOL/$VERSION/tinyutils
    cd $VERSIONDIR
    vi .git/config

Change the https to git.  For commits:

    git push

and enter the password.

