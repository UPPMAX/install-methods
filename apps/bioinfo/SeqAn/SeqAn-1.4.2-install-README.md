# SeqAn-1.4.2-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

SeqAn 1.4.2


DESCRIPTION
-----------

SeqAn sequence analysis apps and C++ library


WEBSITE
-------

    http://www.seqan.de/


MODULE REQUIREMENTS
-------------------

    module load gcc/4.8.3
    module load cmake/2.8.12.2
    module load python/2.7.6
    module load boost/1.55.0


SETUP AND DOWNLOAD
------------------

    TOOL=/sw/apps/bioinfo/SeqAn
    VERSION=1.4.2
    CLUSTER=milou
    TOOLDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    wget http://packages.seqan.de/seqan-src/seqan-src-1.4.2.tar.gz
    tar xzf seqan-src-1.4.2.tar.gz
    SOURCE=seqan-1.4.2
    SOURCEDIR=$TOOLDIR/$SOURCE

Also get the C++ library files.

    wget http://packages.seqan.de/seqan-library/seqan-library-1.4.2.tar.bz2
    tar xjf seqan-library-1.4.2.tar.bz2
    cd seqan-library-1.4.2
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

For tintin, I could not get the sphinx build stuff installed (very strange) so
I will just use the milou install.

    ON TINTIN:
    cmake .. -DCMAKE_INSTALL_PREFIX=$TOOLDIR -DBoost_NO_BOOST_CMAKE=On -DSPHINX_EXECUTABLE=$RE_PYTHON/../../milou/python-packages/bin/sphinx-build -DLEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir" -DCMAKE_CXX_FLAGS="-std=c++11"

Now for both systems:

    make

However for tintin 'make' will fail with the following because the only boost
available is the system boost, which is 1.41, but this feature file was
introduced at some point after this and before 1.55, which is the module boost
available on milou.

    [ 69%] Building CXX object extras/apps/bs_tools/CMakeFiles/casbar.dir/casbar.cpp.o
    /sw/apps/bioinfo/SeqAn/1.4.2/tintin/seqan-1.4.2/extras/apps/bs_tools/casbar.cpp:67:38: fatal error: boost/math/tools/tuple.hpp: No such file or directory
     #include <boost/math/tools/tuple.hpp>
                                          ^
    compilation terminated.
    make[2]: *** [extras/apps/bs_tools/CMakeFiles/casbar.dir/casbar.cpp.o] Error 1
    make[1]: *** [extras/apps/bs_tools/CMakeFiles/casbar.dir/all] Error 2
    make: *** [all] Error 2


Must we create a dummy file and a directory or 'make install' will fail?

    touch /sw/apps/bioinfo/SeqAn/1.4.2/milou/seqan-1.4.2/extras/apps/seqan_flexbar/README
    mkdir /sw/apps/bioinfo/SeqAn/1.4.2/milou/seqan-1.4.2/build/docs/html

    make install


