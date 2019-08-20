boost/1.70.0_intel18.3_mpi3.1.3
==============================

Build boost with GCC tool stack.

<https://www.boost.org>


LOG
---

    TOOL=/sw/libs/boost
    BOOSTVERSION=1.70.0
    INTELVERSION=18.3
    MPIVERSION=3.1.3
    VERSION=${BOOSTVERSION}_intel${INTELVERSION}_mpi${MPIVERSION}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION/$CLUSTER
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do { test -L $CL || ln -s $CLUSTER $CL; } ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    wget https://dl.bintray.com/boostorg/release/${BOOSTVERSION}/source/boost_${BOOSTTARBALLVERSION}.tar.bz2
    tar xjf boost_${BOOSTTARBALLVERSION}.tar.bz2
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load intel/$INTELVERSION
    module load openmpi/$MPIVERSION

    ./bootstrap.sh --with-toolset=intel-linux --prefix=$PFX

For MPI, follow <http://www.boost.org/doc/libs/1_70_0/doc/html/mpi/getting_started.html#mpi.config> and add 

    using mpi ;

around line 26 of the file `project-config.jam` file created by the bootstrap process
(at least after the 'using gcc' and 'using python' lines).  Then continue.

    ./b2
    ./b2 install --prefix=$PFX

    cd ..
    rm -rf boost_${BOOSTVERSION}

