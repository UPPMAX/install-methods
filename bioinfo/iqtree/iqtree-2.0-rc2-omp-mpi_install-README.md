iqtree/2.0-rc2-omp-mpi
========================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI versions, `gcc/8.4.0` and `openmpi/4.0.2` must be loaded.

Used under license:
GPL v2

Structure creating script (makeroom_iqtree_2.0-rc2-omp-mpi.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/iqtree/makeroom_2.0-rc2-omp-mpi.sh

makeroom.sh invoked with:

    makeroom.sh -f -t "iqtree" -v "2.0-rc2-omp-mpi" -s "phylogeny" -w "http://www.iqtree.org" -d "efficient software for phylogenomic inference" -l "GPL v2"

LOG
---

The tool has one version, the module has a different one with an `-omp-mpi`
suffix, hence `TOOLVERSION` and `VERSION`.

The `-mpi` executables don't record where to get the C++ libraries.  That is
annoying, but we have the user load the correct gcc and openmpi modules if
using them, which would be required anyway, so do nothing about them.

    TOOL=iqtree
    TOOLVERSION=2.0-rc2
    VERSION=${TOOLVERSION}-omp-mpi

    cd /sw/bioinfo/iqtree

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "phylogeny" -w "http://www.iqtree.org" -d "efficient software for phylogenomic inference" -l "GPL v2"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module purge
    module load uppmax

    GCCVERSION=8.4.0
    MPIVERSION=4.0.2
    cd ${VERSION}
    mkdir -p $PREFIX/bin
    PFX=$PREFIX/bin
    cd src
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/Cibiv/IQ-TREE/archive/v${TOOLVERSION}.tar.gz 
    rm -rf IQ-TREE-${TOOLVERSION}
    tar xvzf v${TOOLVERSION}.tar.gz 
    cd IQ-TREE-${TOOLVERSION}/
    module load cmake/3.5.1
    module load gcc/$GCCVERSION
    module load Eigen/3.3.4
    module load patchelf

    #
    # Now, build from source, first the OMP version.
    #

    mkdir build_omp
    cd build_omp/
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=omp ..
    make -j$THREADS
    patchelf --set-rpath /sw/comp/gcc/${GCCVERSION}_rackham/lib64 iqtree
    cp -av iqtree $PFX/iqtree-omp
    cd ..

    #
    # Now the single-core version.
    #

    mkdir build
    cd build
    cmake -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include ..
    make -j$THREADS
    patchelf --set-rpath /sw/comp/gcc/${GCCVERSION}_rackham/lib64 iqtree
    cp -av iqtree $PFX/iqtree
    cd ..

    #
    # Now, the MPI version.  `openmpi/${MPIVERSION}` is available for `gcc/${GCCVERSION}`.
    #

    module load gcc/$GCCVERSION openmpi/$MPIVERSION
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


The mf file from 1.6.12-omp-mpi is fine, but with updated gcc and openmpi versions.

