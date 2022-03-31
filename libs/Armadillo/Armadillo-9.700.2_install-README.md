Armadillo/9.700.2
=================

<http://arma.sourceforge.net/>

Used under license:
Apache 2.0
<https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)>

Structure creating script (makeroom_Armadillo_9.700.2.sh) moved to /sw/libs/Armadillo/makeroom_9.700.2.sh

LOG
---

Compile with `gcc/10.3.0`, and allow it to use the system BLAS and LAPACK
libraries, and `cmake/3.22.2`.  The choice to go with system BLAS etc. is
because CMake seems to do a poor job of finding alternative installation
locations.

The install also provides some `.cmake` files under `share/Armadillo/CMake/` so
prepend this to the CMake environment variable `CMAKE_PREFIX_PATH` in the mf
file.


    mkdir -p /sw/libs/Armadillo && cd /sw/libs/Armadillo

    makeroom.sh "-f" "-t" "Armadillo" "-v" "9.700.2" "-c" "libs" "-w" "http://arma.sourceforge.net/" "-l" "Apache 2.0" "-L" "https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)" "-d" "high quality linear algebra library (matrix maths) for the C++ language, aiming towards a good balance between speed and ease of use"

    ./makeroom_Armadillo_9.700.2.sh

    source /sw/libs/Armadillo/SOURCEME_Armadillo_9.700.2 && cd $SRCDIR

Had to copy the source from the EasyBuild tree, since 9.700.2 is no longer available for download.

    # [[ -f armadillo-${VERSION}.tar.xz ]] || wget http://sourceforge.net/projects/arma/files/armadillo-${VERSION}.tar.xz
    cp -av /sw/EasyBuild/rackham/sources/a/Armadillo/armadillo-9.700.2.tar.xz .

Also need to create rackham and snowy/irma/bianca versions, and use a bit older
cmake and gcc.  Enable sparse matrices and use openblas and ATLAS's LAPACK.

    tar xf armadillo-${VERSION}.tar.xz 
    cd armadillo-${VERSION}

    module load cmake/3.7.2
    module load gcc/9.3.0  
    module load openblas/0.3.15
    module load ATLAS/3.10.3 
    module load SuperLU/5.2.1

    cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX -DOpenBLAS_LIBRARY:FILEPATH=$OPENBLAS_ROOT/lib/libopenblas.so -DSuperLU_LIBRARY:FILEPATH=$SUPERLU_ROOT/lib64/libsuperlu.a -DSuperLU_INCLUDE_DIR:PATH=$SUPERLU_ROOT/include -DLAPACK_LIBRARY:FILEPATH=$ATLAS_ROOT/lib/liblapack.a

    make
    make install

For the mf file, we reuse the one for 7.900.0, which includes


    prepend-path CPATH                 $modroot/include
    prepend-path CPLUS_INCLUDE_PATH    $modroot/include
    prepend-path LD_LIBRARY_PATH       $modroot/lib64
    prepend-path LD_RUN_PATH           $modroot/lib64
    prepend-path LIBRARY_PATH          $modroot/lib64
    prepend-path PKG_CONFIG_PATH       $modroot/lib64/pkgconfig
    prepend-path CMAKE_MODULE_PATH     $modroot/share/Armadillo/CMake
    prepend-path CMAKE_PREFIX_PATH     $modroot/share/Armadillo/CMake

