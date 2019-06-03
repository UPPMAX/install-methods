RAxML-NG-0.9.0-mpi-install-README.md
====================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Build MPI version.

    VERSION=0.9.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG
    mkdir ${VERSION}-mpi
    cd ${VERSION}-mpi
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src/
    [[ -f raxml-ng_v${VERSION}_linux_x86_64_MPI.zip ]] || wget https://github.com/amkozlov/raxml-ng/releases/download/${VERSION}/raxml-ng_v${VERSION}_linux_x86_64_MPI.zip
    [[ -f CMakeLists.txt ]] || unzip raxml-ng_v${VERSION}_linux_x86_64_MPI.zip 
    module load cmake/3.7.2
    module load gcc/7.3.0 openmpi/3.1.0
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make
    make install
    cd $PREFIX/bin
    ldd raxml-ng-mpi
    ./raxml-ng-mpi -h

