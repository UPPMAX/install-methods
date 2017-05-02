binutils-2.28-install-README.md
===============================

binutils/2.28, built with plugin support

<https://www.gnu.org/software/binutils/>

LOG
---

    VERSION=2.28
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/comp
    mkdir binutils
    cd binutils
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir -p src
    mkdir -p $CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src
    [[ -f binutils-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/gnu/binutils/binutils-${VERSION}.tar.gz
    tar xzf binutils-${VERSION}.tar.gz
    mv binutils-${VERSION} binutils-${VERSION}_$CLUSTER
    cd binutils-${VERSION}_$CLUSTER/
    module load gcc/5.3.0
    ./configure --enable-plugins --prefix=$PREFIX
    make -j 6
    make install

Use previous mf for binutils.

    cd /sw/comp/binutils/mf
    ln -s 2.26 $VERSION

Repeat for rackham.
