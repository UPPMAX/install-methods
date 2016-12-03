GEM 2.7
========

<http://chipexo.sourceforge.net>

LOG
---

    cd /sw/apps/bioinfo
    mkdir GEM
    cd GEM
    VERSION=2.7
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    P=$PWD
    cd ../src
    wget https://groups.csail.mit.edu/cgs/gem/download/gem.v${VERSION}.tar.gz
    tar xzf gem.v${VERSION}.tar.gz 
    cd gem/
    chmod -x Read_Distribution_default.txt 
    cp -av * $P
    cd $P/..

Since it's java, the other clusters can simply be symlinks.

    ln -s ./milou tintin
    ln -s ./milou irma
    ln -s ./milou bianca

The mf file defines `$GEM` and issues a message about it.

