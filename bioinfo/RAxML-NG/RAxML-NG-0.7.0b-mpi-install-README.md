RAxML-NG-0.7.0b-mpi-install-README.md
=================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Build MPI and non-MPI version.

    VERSION=0.7.0b
    REMOTEVERSION=${VERSION/b/}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG
    mkdir ${VERSION}-mpi
    cd ${VERSION}-mpi
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src/
    [[ -f raxml-ng_v${REMOTEVERSION}_linux_x86_64_MPI.zip ]] || wget https://github.com/amkozlov/raxml-ng/releases/download/${REMOTEVERSION}/raxml-ng_v${REMOTEVERSION}_linux_x86_64_MPI.zip
    [[ -f CMakeLists.txt ]] || unzip raxml-ng_v${REMOTEVERSION}_linux_x86_64_MPI.zip 
    module load cmake/3.7.2
    module load gcc/7.3.0 openmpi/3.1.0
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    cmake ..
    make
    cd ../bin
    ldd raxml-ng-mpi
    ./raxml-ng-mpi -h
    cd ..
    cp -av bin ../$CLUSTER/

