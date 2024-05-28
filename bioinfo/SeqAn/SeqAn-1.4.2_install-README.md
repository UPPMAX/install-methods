SeqAn/1.4.2
===========

SeqAn sequence analysis apps and C++ library

<http://www.seqan.de/>


MODULE REQUIREMENTS
-------------------

    module load gcc/4.8.3
    #module load cmake/2.8.12.2
    module load python/2.7.6
    module load boost/1.55.0_gcc4.8.3


SETUP AND DOWNLOAD
------------------

    TOOL=/sw/apps/bioinfo/SeqAn
    VERSION=1.4.2
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOLDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    wget http://packages.seqan.de/seqan-src/seqan-src-${VERSION}.tar.gz
    tar xzf seqan-src-${VERSION}.tar.gz
    SOURCE=seqan-${VERSION}
    SOURCEDIR=$TOOLDIR/$SOURCE

Also get the C++ library files.

    wget http://packages.seqan.de/seqan-library/seqan-library-${VERSION}.tar.bz2
    tar xjf seqan-library-${VERSION}.tar.bz2
    cd seqan-library-${VERSION}
    mv -v include share $TOOLDIR/
    cd ..


MODULE PREREQUISITES
--------------------

To install a few required python packages.

    export RE_PYTHON=$TOOLDIR/python_packages
    mkdir -p $RE_PYTHON

The nose and Sphinx (special version) python packages.

    pip install --install-option="--prefix=$RE_PYTHON" nose
    pip install --install-option="--prefix=$RE_PYTHON" seqansphinx

    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$RE_PYTHON/lib/python2.7/site-packages"
    export PYTHONPATH=LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$RE_PYTHON/lib/python2.7/site-packages"

To get Sphinx found during building, we need to add this to the cmake command
line:

    -DSPHINX_EXECUTABLE=$RE_PYTHON/bin/sphinx-build

A real pain in the butt: we need to prevent CMake from using the system Boost
libraries that were built with CMake, since it will use them no matter what
unless we set this one flag on the cmake command line:

    -DBoost_NO_BOOST_CMAKE=On

Now before continuing with the configuration, get module prereqs.

    MODULE_REQS=$TOOLDIR/module_reqs
    mkdir -p $MODULE_REQS
    cd $MODULE_REQS

The LEMON library (http://lemon.cs.elte.hu) is used for breakpoint discovery.
LEMON would like to use SoPlex (http://soplex.zib.de) as a solver, but I cannot
get that to build with lemon.  It would also like to use the COIN-OR solver
set, but even with a prebuilt copy it is a problem.

Setting up lemon.

    wget http://lemon.cs.elte.hu/pub/sources/lemon-1.3.1.tar.gz
    tar xzf lemon-1.3.1.tar.gz
    cd lemon-1.3.1
    vi +3 CMakeLists.txt

Now comment out with '#' this line, which contains `CMAKE_POLICY(SET CMP0048 OLD)`.
This is used for newer CMake.

    mkdir build installdir
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$MODULE_REQS/lemon-1.3.1/installdir
    make
    make install

Now to find out how to configure SeqAn to look for LEMON in the right place.

    view $SOURCEDIR/extras/apps/breakpoint_calculator/FindLEMON.cmake

It looks for the variable `LEMON_ROOT_DIR` to be set, which points to the
directory holding `include/` and `lib/`, which for us is
`$MODULE_REQS/lemon-1.3.1/installdir`.

    export LEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir"

and just for safety add this to the cmake command line:

    -DLEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir"


BUILD SEQAN (FINALLY)
---------------------

Turns out we also should provide -std=c++11 to the g++ build.

    cd $SOURCEDIR
    mkdir build installdir
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$TOOLDIR -DBoost_NO_SYSTEM_PATHS=On -DBoost_NO_BOOST_CMAKE=On -DSPHINX_EXECUTABLE=$RE_PYTHON/bin/sphinx-build -DLEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir" -DCMAKE_CXX_FLAGS="-std=c++11"

For rackham: cmake will produce errors about Zlib not found, and
ultimately make will fail unless `zlib/1.2.8` is loaded and the cmake line is
updated:

    cmake .. -DCMAKE_INSTALL_PREFIX=$TOOLDIR -DBoost_NO_SYSTEM_PATHS=On -DBoost_NO_BOOST_CMAKE=On -DSPHINX_EXECUTABLE=$RE_PYTHON/bin/sphinx-build -DLEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir" -DCMAKE_CXX_FLAGS="-std=c++11" -DZLIB_INCLUDE_DIR=/sw/libs/zlib/1.2.8/include -DZLIB_LIBRARY=/sw/libs/zlib/1.2.8/lib/libz.so

See older versions of this file within <https://github.com/UPPMAX/install-methods> for tintin issues.

Now for both systems:

    make

A file and a directory must be created or `make install` will fail.

    touch /sw/apps/bioinfo/SeqAn/1.4.2/${CLUSTER}/seqan-1.4.2/extras/apps/seqan_flexbar/README
    mkdir /sw/apps/bioinfo/SeqAn/1.4.2/${CLUSTER}/seqan-1.4.2/build/docs/html

    make install


