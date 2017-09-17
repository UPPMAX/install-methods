boost/1.63.0_gcc6.3.0
=====================

Build boost with GCC tool stack and MPI support.

<https://www.boost.org>


LOG
---

    TOOL=/sw/apps/build/boost
    BOOSTVERSION=1.63.0
    GCCVERSION=6.3.0
    MPIVERSION=2.0.2
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}_mpi${MPIVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION/$CLUSTER
    PFX=$PWD
    cd ../../src
    tar xjf boost_${BOOSTVERSION//./_}.tar.bz2
    mv boost_${BOOSTVERSION//./_} boost_${BOOSTVERSION//./_}-$CLUSTER
    cd boost_${BOOSTVERSION//./_}-$CLUSTER

    module load gcc/$GCCVERSION
    module load openmpi/$MPIVERSION

    ./bootstrap.sh --prefix=$PFX

For MPI, follow <http://www.boost.org/doc/libs/1_64_0/doc/html/mpi/getting_started.html#mpi.config> and add 

    using mpi ;

around line 26 of the file `project-config.jam` file created by the bootstrap process
(at least after the 'using gcc' and 'using python' lines).  Then continue.

    ./b2
    ./b2 install

And remove the source tree.

    cd ..
    rm -rf boost_${BOOSTVERSION//./_}-$CLUSTER

