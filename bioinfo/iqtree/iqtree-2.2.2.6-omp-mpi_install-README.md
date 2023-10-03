iqtree/2.2.2.6-omp-mpi
======================

IQ-TREE, providing OMP, single-core and MPI versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

For the MPI executable, `gcc/9.3.0` and `openmpi/3.1.5` must be loaded.

Used under license:
GPL v2

They have included OpenMP in every executable, so there is no longer a real
single-thread or pure-MPI executable. We make symlinks.

Note also that there's a step early in the cmake process that produces the line

    Vectorization : SSE3/AVX/AVX2

So, we should compile separately for snowy. See the end of this file.


LOG
---

We have to pull the git repository and checkout to the appropriate tag, since it uses submodules.

The tree includes a copy of the zlib 1.2.7 tree.  We will instead load the zlib/1.2.12 module and use that.

We will also use boost/1.83.0-gcc12.3.0 and boost/1.83.0-gcc12.3.0-mpi4.1.5.
We need to change a cmake default policy CMP0047 so that it uses `_ROOT`
environment variables, since zlib/1.2.12 defines `ZLIB_ROOT`, openmpi/4.1.5
defines `MPI_ROOT`, and the boost modules define `BOOST_ROOT`.  For boost we
also need to define the `-DBoost_NO_BOOST_CMAKE=ON` option, as described by the
boost modules.  The command line options required are 

    cmake .....  -DCMAKE_POLICY_DEFAULT_CMP0074=NEW  -DBoost_NO_BOOST_CMAKE=ON   .....

The tool has one version, the module has a different one with an `-omp-mpi`
suffix, hence `TOOLVERSION` and `VERSION`.

The `-mpi` executables don't record where to get the C++ and MPI libraries.
That is annoying, but we have the user load the correct gcc and openmpi modules
if using them, which would be required anyway, so do nothing about them.

    TOOL=iqtree
    TOOLVERSION=2.2.2.6
    GCCVERSION=12.3.0
    MPIVERSION=4.1.5
    BOOSTVERSION=1.83.0-gcc${GCCVERSION}
    BOOSTMPIVERSION=${BOOSTVERSION}-mpi${MPIVERSION}
    VERSION=${TOOLVERSION}-omp-mpi

    cd /sw/bioinfo/iqtree

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "phylogeny" -w "http://www.iqtree.org" -d "efficient software for phylogenomic inference" -l "GPL v2"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    mkdir -p $PREFIX/bin

    cd $SRCDIR

Install precompiled linux 64-bit binary and link iqtree2-omp as a synonym.

    wget https://github.com/iqtree/iqtree2/releases/download/v2.2.2.6/iqtree-2.2.2.6-Linux.tar.gz
    tar xf iqtree-2.2.2.6-Linux.tar.gz
    cd iqtree-2.2.2.6-Linux
    cp -av bin/iqtree2 $PREFIX/bin/
    cd $PREFIX/bin
    ln -s iqtree2 iqtree2-omp


Now, build the MPI version from source. Ensure `openmpi/${MPIVERSION}` is available for `gcc/${GCCVERSION}` and that a boost module exists for both.

    module purge
    module load uppmax
    module load git/2.34.1
    module load cmake/3.26.3
    module load gcc/$GCCVERSION
    module load boost/$BOOSTVERSION
    module load zlib/1.2.12
    module load Eigen/3.3.4
    module load patchelf

    rm -rf iqtree2
    git clone --recursive https://github.com/iqtree/iqtree2
    cd iqtree2
    git checkout v2.2.2.6


    mkdir build_mpi
    cd build_mpi
    module load openmpi/$MPIVERSION
    module load boost/$BOOSTMPIVERSION
    cmake -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBoost_NO_BOOST_CMAKE=ON -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=mpi -DCMAKE_CXX_COMPILER:FILEPATH=mpic++ -DCMAKE_C_COMPILER:FILEPATH=mpicc ..
    make -j 10
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


Make sure that libraries can be found, *except for* the MPI library which is found for the MPI executable by loading the MPI module, which is required.

    module purge
    cd $PREFIX/bin
    ldd *


snowy
-----

Do much of the above but on snowy-lr1. Link to the prebuilt executable for the
OMP version. Build from source for the MPI version. The git checkout etc is
already done, so just build within snowy-specific directories.

    TOOL=iqtree
    TOOLVERSION=2.2.2.6
    GCCVERSION=12.3.0
    MPIVERSION=4.1.5
    BOOSTVERSION=1.83.0-gcc${GCCVERSION}
    BOOSTMPIVERSION=${BOOSTVERSION}-mpi${MPIVERSION}
    VERSION=${TOOLVERSION}-omp-mpi

    cd /sw/bioinfo/iqtree

    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSIONDIR
    [[ -L snowy ]] && { rm -f snowy; mkdir snowy; } || { cd snowy; rm -rf *; }

    mkdir -p $PREFIX/bin

    cd $PREFIX/bin
    ln -s ../../rackham/bin/iqtree2 .
    ln -s iqtree2 iqtree2-omp

    cd $SRCDIR

    module purge
    module load uppmax
    module load git/2.34.1
    module load cmake/3.26.3
    module load gcc/$GCCVERSION
    module load boost/$BOOSTVERSION
    module load zlib/1.2.12
    module load Eigen/3.3.4
    module load patchelf

    mkdir build_mpi_snowy
    cd build_mpi_snowy
    module load openmpi/$MPIVERSION
    module load boost/$BOOSTMPIVERSION
    cmake -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DBoost_NO_BOOST_CMAKE=ON -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include -DIQTREE_FLAGS=mpi -DCMAKE_CXX_COMPILER:FILEPATH=mpic++ -DCMAKE_C_COMPILER:FILEPATH=mpicc ..
    make -j 10
    module load patchelf
    patchelf --set-rpath "$ZLIB_ROOT/lib:/sw/comp/gcc/${GCCVERSION}_rackham/lib64" iqtree2-mpi
    # this does not cover everything, since we still need commands from the openmpi module
    cp -av iqtree2-mpi $PREFIX/bin/iqtree2-mpi
    cd ..

    pushd .
    cd $PREFIX/bin
    ln -s iqtree2-mpi iqtree2-omp-mpi
    popd


    module purge
    cd $PREFIX/bin
    ldd *

