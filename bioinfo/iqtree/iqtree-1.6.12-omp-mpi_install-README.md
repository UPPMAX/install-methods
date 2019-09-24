iqtree/1.6.12-omp-mpi
========================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI versions, `gcc/8.2.0` and `openmpi/3.1.1` must be loaded.


Used under license:
GPL v2

Structure creating script (makeroom_iqtree_1.6.12-omp-mpi.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/iqtree/makeroom_1.6.12-omp-mpi.sh

    makeroom.sh -f -t iqtree -v 1.6.12-omp-mpi -s phylogeny -w http://www.iqtree.org -d "efficient software for phylogenomic inference" -l 'GPL v2'

LOG
---

The tool has one version, the module has an -omp suffix, hence `VERSIONTOOL`
and `VERSION`.

The `-mpi` executables don't record where to get the C++ libraries.  That is
annoying, but we have the user load the correct gcc and openmpi modules if
using them, which would be required anyway, so do nothing about them.

    module purge
    module load uppmax
    cd /sw/bioinfo/iqtree
    source SOURCEME_iqtree_1.6.12-omp-mpi
    VERSIONTOOL=1.6.12
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
    module load gcc/8.2.0
    module load Eigen/3.3.4

    #
    # Now, build from source, first the OMP version.
    #

    mkdir build_omp
    cd build_omp/
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=omp ..
    make -j$THREADS
    patchelf --set-rpath /sw/comp/gcc/8.2.0_rackham/lib64 iqtree
    cp -av iqtree $PFX/iqtree-omp
    cd ..

    #
    # Now the single-core version.
    #

    mkdir build
    cd build
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include ..
    make -j$THREADS
    patchelf --set-rpath /sw/comp/gcc/8.2.0_rackham/lib64 iqtree
    cp -av iqtree $PFX/iqtree
    cd ..

    #
    # Now, the MPI version.  `openmpi/3.1.1` is available for `gcc/8.2.0`.
    #

    module load openmpi/3.1.1
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


The mf file from 1.6.10-omp-mpi is fine, but with updated gcc and openmpi versions.

