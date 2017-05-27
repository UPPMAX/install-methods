Armadillo/7.900.0
=================

<http://arma.sourceforge.net/>

LOG
---

Compile with `gcc/5.4.0`, and allow it to use the system BLAS and LAPACK
libraries.  It uses cmake, so use `cmake/3.5.1` which is newly available on all
systems.  The choice to go with system BLAS etc. is because CMake seems to do a
poor job of finding alternative installation locations.

The install also provides some `.cmake` files under `share/Armadillo/CMake/` so
prepend this to the CMake environment variable `CMAKE_PREFIX_PATH` in the mf
file.

    cd /sw/libs
    mkdir Armadillo
    cd Armadillo
    VERSION=7.900.0
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f armadillo-${VERSION}.tar.xz ]] || wget http://sourceforge.net/projects/arma/files/armadillo-${VERSION}.tar.xz
    tar xJvf armadillo-${VERSION}.tar.xz 
    mv armadillo-${VERSION} armadillo-${VERSION}_${CLUSTER}
    cd armadillo-${VERSION}_${CLUSTER}
    module load cmake/3.5.1
    module load gcc/5.4.0
    cmake . -DCMAKE_INSTALL_PREFIX=$PFX
    make
    make install

For the mf file, we started with a copy of the Poppler mf file for the
variables to set.  The environment variable to add to for CMake is
`CMAKE_PREFIX_PATH`, and a `armadillo.pc` file is also provided for
`pkg-config`.  No man pages, no executables.  Be sure to set
`CPLUS_INCLUDE_PATH` so `g++` can find the headers.  The mf sets:


    prepend-path CPATH                 $modroot/include
    prepend-path CPLUS_INCLUDE_PATH    $modroot/include
    prepend-path LD_LIBRARY_PATH       $modroot/lib64
    prepend-path LD_RUN_PATH           $modroot/lib64
    prepend-path LIBRARY_PATH          $modroot/lib64
    prepend-path PKG_CONFIG_PATH       $modroot/lib64/pkgconfig
    prepend-path CMAKE_PREFIX_PATH     $modroot/share/Armadillo/CMake

