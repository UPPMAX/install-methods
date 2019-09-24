GEM/3.4
=======

<https://groups.csail.mit.edu/cgs/gem/>


LOG
---

    cd /sw/bioinfo
    mkdir GEM
    cd GEM
    VERSION=3.4
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    wget https://groups.csail.mit.edu/cgs/gem/download/gem.v${VERSION}.tar.gz
    tar xzf gem.v${VERSION}.tar.gz 
    cd gem/
    chmod -x Read_Distribution_default.txt 
    cp -av * $PREFIX/

The mf file defines `$GEM` and issues a message about it.

