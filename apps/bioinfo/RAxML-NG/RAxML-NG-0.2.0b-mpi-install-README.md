RAxML-NG-0.2.0b-mpi-install-README.md
=================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Build MPI and non-MPI version.

    VERSION=0.2.0b
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG

First, the MPI version.

    mkdir ${VERSION}-mpi
    cd ${VERSION}-mpi
    mkdir $CLUSTER
    mkdir src
    cd src/
    [[ -f raxml-ng_v0.2.0b_linux_x86_64_MPI.zip ]] || wget https://github.com/amkozlov/raxml-ng/releases/download/${VERSION/b/}/raxml-ng_v${VERSION}_linux_x86_64_MPI.zip
    [[ -f CMakeLists.txt ]] || unzip raxml-ng_v0.2.0b_linux_x86_64_MPI.zip 

On rackham, don't load cmake as this is the default version.

    module load cmake/2.8.12.2

    module load gcc/6.3.0 openmpi/2.0.1
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    cmake ..

Make sure MPI is found.

    make
    cd ../bin
    ldd raxml-ng-mpi
    ./raxml-ng-mpi -h
    cd ..
    cp -av bin ../$CLUSTER/
