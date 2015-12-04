# tinyutils-default-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    tinyutils

DESCRIPTION
-----------

    Collection of small awk utilities for operating on columns of numbers.

WEBSITE
-------

    https://github.com/douglasgscofield/tinyutils

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/tinyutils/default/tinyutils to the user PATH.

    No cluster- or version-specific elements, just setting version to default

LOG
---

    TOOL=/sw/apps/tinyutils
    VERSION=default
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
