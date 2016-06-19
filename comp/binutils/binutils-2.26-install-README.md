binutils-2.26-install-README.md
===============================

binutils/2.26, built with plugin support

<https://www.gnu.org/software/binutils/>

LOG
---

    VERSION=2.26
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
    cd binutils-${VERSION}_milou/
    module load gcc/5.3.0
    ./configure --enable-plugins --prefix=$PREFIX
    make -j 4
    make install

Use coreutils mf for binutils.

    cd /sw/comp/binutils
    mkdir -p mf
    cd mf
    cp ../../../apps/coreutils/mf/8.25 $VERSION
    vi $VERSION

Repeat for tintin.
