pblat-cluster/1.1
========================

<https://icebert.github.io/pblat-cluster/>

Used under license:
Same as Blat
<https://github.com/icebert/pblat-cluster/blob/master/LICENSE>

Structure creating script (makeroom_pblat-cluster_1.1.sh) moved to /sw/bioinfo/pblat-cluster/makeroom_1.1.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "pblat-cluster" "-v" "1.1" "-w" "https://icebert.github.io/pblat-cluster/" "-l" "Same as Blat" "-L" "https://github.com/icebert/pblat-cluster/blob/master/LICENSE" "-d" "blat with cluster parallel hybrid computing support"
    ./makeroom_pblat-cluster_1.1.sh
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

