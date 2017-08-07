automake/1.14.1
===============

Compile with system compiler.

LOG
---

    VERSION=1.14.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/automake
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f automake-${VERSION}.tar.gz ]] || wget https://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz
    tar xzf automake-${VERSION}.tar.gz 
    cd automake-${VERSION}
    module load build-tools
    ./configure --prefix=$PFX
    make && make check && make install
