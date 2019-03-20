iqtree/1.6.10-omp-mpi
================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI versions, `gcc/6.3.0` and `openmpi/2.1.0` must be loaded.

LOG
---

The tool has one version, the module has an -omp suffix, hence `VERSIONTOOL`
and `VERSION`.

The `-mpi` executables don't record where to get the C++ libraries.  That is
annoying, but we have the user load the correct gcc and openmpi modules if
using them, which would be required anyway, so do nothing about them.

    module purge
    module load uppmax
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/bioinfo/iqtree
    VERSIONTOOL=1.6.10
    VERSION=${VERSIONTOOL}-omp-mpi
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir -p $CLUSTER/bin
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER/bin
    PFX=$PWD
    cd ../..
    mkdir -p src
    cd src
    [[ -f v${VERSIONTOOL}.tar.gz ]] || wget https://github.com/Cibiv/IQ-TREE/archive/v${VERSIONTOOL}.tar.gz 
    rm -rf IQ-TREE-${VERSIONTOOL}
    tar xvzf v${VERSIONTOOL}.tar.gz 
    cd IQ-TREE-${VERSIONTOOL}/
    module load cmake/3.5.1
    module load gcc/6.3.0
    module load Eigen/3.3.4

    #
    # Now, build from source, first the OMP version.
    #

    mkdir build_omp
    cd build_omp/
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=omp ..
    make -j$THREADS
    cp -av iqtree $PFX/iqtree-omp
    cd ..

    #
    # Now the single-core version.
    #

    mkdir build
    cd build
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include ..
    make -j$THREADS
    cp -av iqtree $PFX/iqtree
    cd ..

    #
    # Now, the MPI version.  `openmpi/2.1.0` is available for `gcc/6.3.0`.
    #

    module load openmpi/2.1.0
    mkdir build_mpi
    cd build_mpi
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=mpi ..
    make -j$THREADS
    cp -av iqtree-mpi $PFX/iqtree-mpi
    cd ..

    #
    # Now, the OpenMPI-MPI hybrid version.
    #

    mkdir build_omp_mpi
    cd build_omp_mpi
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=omp-mpi ..
    make -j$THREADS
    cp -av iqtree-mpi $PFX/iqtree-omp-mpi


The mf file from 1.5.4-omp-mpi is fine.
