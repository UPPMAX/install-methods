iqtree/2.2.0-omp-mpi
====================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI versions, `gcc/9.3.0` and `openmpi/4.0.3` must be loaded.

Used under license:
GPL v2

LOG
---

The tree includes a copy of the zlib 1.2.7 tree.  We will instead load the zlib/1.2.12 module and use that.
We will also use boost/1.70.0_gcc9.3.0 and boost/1.70.0_gcc9.3.0_mpi3.1.5.
We need to change a cmake default policy CMP0047 so that it uses `_ROOT` environment variables, since zlib/1.2.12 defines `ZLIB_ROOT`, openmpi/3.1.5 defines `MPI_ROOT`, and the boost modules define `BOOST_ROOT`.  For boost we also need to define the `-DBoost_NO_BOOST_CMAKE=ON` option, as described by the boost modules.  The command line options required are 

    cmake .....  -DCMAKE_POLICY_DEFAULT_CMP0074=NEW  -DBoost_NO_BOOST_CMAKE=ON   .....

The tool has one version, the module has a different one with an `-omp-mpi`
suffix, hence `TOOLVERSION` and `VERSION`.

The `-mpi` executables don't record where to get the C++ libraries.  That is
annoying, but we have the user load the correct gcc and openmpi modules if
using them, which would be required anyway, so do nothing about them.

    TOOL=iqtree
    TOOLVERSION=2.2.0
    GCCVERSION=9.3.0
    MPIVERSION=3.1.5
    BOOSTVERSION=1.70.0_gcc${GCCVERSION}
    BOOSTMPIVERSION=1.70.0_gcc${GCCVERSION}_mpi${MPIVERSION}
    VERSION=${TOOLVERSION}-omp-mpi

    cd /sw/bioinfo/iqtree

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "phylogeny" -w "http://www.iqtree.org" -d "efficient software for phylogenomic inference" -l "GPL v2"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    module purge
    module load uppmax

    cd ${VERSIONDIR}
    mkdir -p $PREFIX/bin

    cd $SRCDIR
    #     [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/Cibiv/IQ-TREE/archive/v${TOOLVERSION}.tar.gz   # older version
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/iqtree/iqtree2/archive/refs/tags/v${TOOLVERSION}.tar.gz

    rm -rf iqtree2-${TOOLVERSION}
    tar xvf v${TOOLVERSION}.tar.gz 
    cd iqtree2-${TOOLVERSION}
    module load cmake/3.22.2
    module load gcc/$GCCVERSION
    module load boost/$BOOSTVERSION
    module load zlib/1.2.12
    module load Eigen/3.3.4
    module load patchelf


    #
    # Now, build from source, first the OMP version.  Executable is called iqtree2
    #

    mkdir build_omp
    cd build_omp/
    cmake -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBoost_NO_BOOST_CMAKE=ON -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=omp ..
    make
    patchelf --set-rpath "$ZLIB_ROOT/lib:/sw/comp/gcc/${GCCVERSION}_rackham/lib64" iqtree2
    cp -av iqtree2 $PREFIX/bin/iqtree2-omp
    cd ..


The previous 'single-core' default now includes OpenMP, so simply link to it

    pushd .
    cd $PREFIX/bin
    ln -s iqtree2-omp iqtree2
    popd


Now, the MPI version. Ensure `openmpi/${MPIVERSION}` is available for `gcc/${GCCVERSION}` and that a boost module exists for both.

We also must edit line 46 of /sw/bioinfo/iqtree/2.2.0-omp-mpi/src/iqtree2-2.2.0/pll/genericParallelization.c to uncomment the inclusion of `<mpi.h>`.
This is fixed in the 2.2.2.2 source tree by surrounding it with an ifdef gate <https://raw.githubusercontent.com/iqtree/iqtree2/master/pll/genericParallelization.c>.

    mkdir build_mpi
    cd build_mpi
    module load openmpi/$MPIVERSION
    module load boost/$BOOSTMPIVERSION
    cmake -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBoost_NO_BOOST_CMAKE=ON -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=mpi -DCMAKE_CXX_COMPILER:FILEPATH=$(which mpic++) -DCMAKE_CXX_FLAGS=-I$MPI_ROOT/include -DCMAKE_C_COMPILER:FILEPATH=$(which mpicc) -DCMAKE_C_FLAGS=-I$MPI_ROOT/include ..
    make
    module load patchelf
    patchelf --set-rpath "$ZLIB_ROOT/lib:/sw/comp/gcc/${GCCVERSION}_rackham/lib64" iqtree2-mpi
    # this does not cover everything, since we still need commands from the openmpi module
    cp -av iqtree2-mpi $PREFIX/bin/iqtree2-mpi
    cd ..

Now, the OpenMPI-MPI hybrid version.  This is now the same as the mpi version, so create a symlink in $PREFIX/bin.

    pushd .
    cd $PREFIX/bin
    ln -s iqtree2-mpi iqtree2-omp-mpi
    popd


The mf file from 2.0-rc2-omp-mpi is fine, with updates to the gcc and openmpi versions.

