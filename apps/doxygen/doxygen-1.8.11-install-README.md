# doxygen-1.8.11-install-README.md

doxygen/1.8.11
==============

<http://www.stack.nl/~dimitri/doxygen/>

LOG
---

Build GUI wizard too.

    VERSION=1.8.11
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/doxygen
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src
    [[ -f doxygen-${VERSION}.src.tar.gz ]] || wget ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${VERSION}.src.tar.gz
    tar xzf doxygen-${VERSION}.src.tar.gz 
    mv doxygen-${VERSION} doxygen-${VERSION}_$CLUSTER
    cd doxygen-${VERSION}_$CLUSTER/
    mkdir build
    cd build

On milou:

    module load cmake/2.8.12.2

On both milou and rackham:

    module load texlive/2015
    module load gcc/5.3.0
    module load perl/5.18.4
    module load python/2.7.6
    cmake  -Dbuild_wizard=YES -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX ..
    make
    make install

