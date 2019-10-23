pblat-cluster/1.0
=================

MPI pblat

<http://icebert.github.io/pblat-cluster/>

<https://github.com/icebert/pblat-cluster>

LOG
---

    VERSION=1.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo
    mkdir pblat-cluster
    cd pblat-cluster
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/icebert/pblat-cluster/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd pblat-cluster-${VERSION}/
    module load gcc/8.3.0
    module load openmpi/3.1.3
    make
    cp pblat-cluster $PREFIX/

