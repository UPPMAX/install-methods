diamond 0.8.26
==============

Fast blast replacement.

<https://github.com/bbuchfink/diamond>

As for earlier versions, diamond database updates are done monthly on milou-b
via this crontab entry.  I have switched to this diamond version for next build.

    30 0 2 * * /sw/data/uppnex/diamond_databases/diamond-update-dbs.sh

LOG
---

    cd /sw/apps/bioinfo/diamond/
    VERSION=0.8.26
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
    module load gcc/6.2.0
    tar xzf v${VERSION}.tar.gz
    cd diamond-$VERSION
    ./build_simple.sh 

Much simpler than the earlier builds, which needed boost.  Any shared libraries
that can't be found?

    module unload gcc
    ldd diamond

Nope, rpath used.  Copy executable and manual.

    cp diamond diamond_manual.pdf ../../$CLUSTER
