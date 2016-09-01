# tinyutils-1.3-install-README.md

tinyutils/1.3
=============

Collection of small awk utilities for operating on columns of numbers.


WEBSITE
-------

<https://github.com/douglasgscofield/tinyutils>


MODULE REQUIREMENTS
-------------------

Add `/sw/apps/tinyutils/1.3/tinyutils` to the user `PATH`.


LOG
---

    TOOL=/sw/apps/tinyutils
    VERSION=1.3
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir milou src
    ln -s ./milou tintin
    ln -s ./milou irma
    cd src
    wget https://github.com/douglasgscofield/tinyutils/releases/download/${VERSION}/tinyutils-${VERSION}.tar.gz
    tar xzf tinyutils-${VERSION}.tar.gz 
    make copyscript
    T=$PWD
    cd ../milou/
    $T/copyscript.sh

Use same mf as 1.1.

