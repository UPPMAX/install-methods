iqtree/1.5.4-omp-mpi
================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI versions, gcc/6.3.0 and openmpi/2.1.0 must be loaded.

LOG
---

The tool has one version, the module has an -omp suffix, hence `VERSIONTOOL` and `VERSION`.

    module purge
    module load uppmax
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    [[ $(uname -n | cut -f1 -d.) == milou-b ]] && THREADS=8 || THREADS=1
    cd /sw/apps/bioinfo/iqtree
    VERSIONTOOL=1.5.4
    VERSION=${VERSIONTOOL}-omp-mpi
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir -p $CLUSTER/bin
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

    #
    # Now, build from source, first the OMP version.
    #

    mkdir build_omp
    cd build_omp/
    cmake -DIQTREE_FLAGS=omp ..
    make -j$THREADS
    cp iqtree-omp $PFX/
    cd ..

    #
    # Now the single-core version.
    #

    mkdir build
    cd build
    cmake  ..
    make -j$THREADS
    cp iqtree $PFX/
    cd ..

    #
    # Now, the MPI version.  `openmpi/2.1.0` is available for `gcc/6.3.0`.
    #

    module load openmpi/2.1.0
    mkdir build_mpi
    cd build_mpi
    cmake -DIQTREE_FLAGS=mpi ..
    make -j$THREADS
    cp iqtree-mpi $PFX/
    cd ..

    #
    # Now, the OpenMPI-MPI hybrid version.
    #

    mkdir build_omp_mpi
    cd build_omp_mpi
    cmake -DIQTREE_FLAGS=omp-mpi ..
    make -j$THREADS
    cp iqtree-omp-mpi $PFX/

