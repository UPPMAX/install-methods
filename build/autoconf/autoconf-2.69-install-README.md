autoconf/2.69
===============

Compile with system compiler.

LOG
---

    VERSION=2.69
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/autoconf
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f autoconf-${VERSION}.tar.gz ]] || wget https://ftp.gnu.org/gnu/autoconf/autoconf-${VERSION}.tar.gz
    tar xzf autoconf-${VERSION}.tar.gz 
    cd autoconf-${VERSION}
    module load build-tools
    ./configure --prefix=$PFX
    make && make check && make install
