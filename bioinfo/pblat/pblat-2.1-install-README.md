pblat/2.1
=========

Parallel blat using pthreads.

<http://icebert.github.io/pblat/>

<https://github.com/icebert/pblat>

LOG
---

    VERSION=2.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo
    mkdir pblat
    cd pblat
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/icebert/pblat/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd pblat-${VERSION}/
    module load gcc/8.3.0
    make
    cp pblat $PREFIX/

Use mf from 2.0.
