diamond/0.9.26
==============

<https://github.com/bbuchfink/diamond>

Used under license:
GPL v3

Structure creating script (makeroom_diamond_0.9.26.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/diamond/makeroom_0.9.26.sh


As for earlier versions, diamond database updates are done monthly on rackham5
via this crontab entry.  I have switched to this diamond version for next build.

    30 0 2 * * /sw/data/diamond_databases/diamond-update-dbs.sh

LOG
---

    cd /sw/bioinfo/diamond/
    VERSION=0.9.26
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd diamond-$VERSION
    module load cmake/3.13.2
    module load zlib/1.2.11
    module load gcc/8.3.0

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DZLIB_ROOT=$ZLIB_ROOT ..
    make
    make install

Make sure RPATH info is correct.

    module unload gcc zlib cmake
    cd $PREFIX/bin
    ldd diamond

Get local copy of the manual.

    cd $PREFIX/..
    wget https://github.com/bbuchfink/diamond/raw/master/diamond_manual.pdf

