diamond/0.9.24
==============

Fast blast replacement.

<https://github.com/bbuchfink/diamond>

As for earlier versions, diamond database updates are done monthly on milou-b
via this crontab entry.  I have switched to this diamond version for next build.

    30 0 2 * * /sw/data/uppnex/diamond_databases/diamond-update-dbs.sh

LOG
---

    cd /sw/bioinfo/diamond/
    VERSION=0.9.24
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd diamond-$VERSION
    module load cmake/3.13.2
    module load zlib/1.2.11
    module load gcc/7.4.0

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PFX -DZLIB_ROOT=$ZLIB_ROOT ..
    make
    make install

Make sure RPATH info is correct.

    module unload gcc zlib cmake
    cd $PFX/bin
    ldd diamond

Get local copy of the manual.

    cd $PFX/..
    wget https://github.com/bbuchfink/diamond/raw/master/diamond_manual.pdf
