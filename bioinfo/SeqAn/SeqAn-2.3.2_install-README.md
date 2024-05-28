# SeqAn-2.3.2_install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

SeqAn 2.3.2


DESCRIPTION
-----------

SeqAn sequence analysis apps and C++ library


WEBSITE
-------

<http://www.seqan.de/>
<https://github.com/seqan/seqan>


MODULE REQUIREMENTS
-------------------

    module load python/2.7.6
    module load cmake/3.5.1
    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0


SETUP AND DOWNLOAD
------------------

    TOOL=/sw/apps/bioinfo/SeqAn
    VERSION=2.3.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOLDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    CLUSTERSOURCE=$TOOL/$VERSION/src_$CLUSTER
    cd $CLUSTERSOURCE
    wget http://packages.seqan.de/seqan-src/seqan-src-${VERSION}.tar.gz
    tar xzf seqan-src-${VERSION}.tar.gz
    SOURCE=seqan-seqan-v${VERSION}
    SOURCEDIR=$CLUSTERSOURCE/$SOURCE

Also get the C++ library files.

    wget http://packages.seqan.de/seqan-library/seqan-library-${VERSION}.tar.xz
    tar xJf seqan-library-${VERSION}.tar.xz
    cd seqan-library-${VERSION}
    mv -v include share $TOOLDIR/
    cd ..

At this point, we should be in `$CLUSTERSOURCE`.


MODULE PREREQUISITES
--------------------

To install a few required python packages.

    export RE_PYTHON=$TOOLDIR/python_packages
    mkdir -p $RE_PYTHON

The nose and Sphinx (special version) python packages.  NOTE: nose comes in via
python/2.7.6, so no need (at least on milou).

    PYTHONUSERBASE=$RE_PYTHON pip install --user nose
    PYTHONUSERBASE=$RE_PYTHON pip install --user seqansphinx

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
    cmake .. -DCMAKE_INSTALL_PREFIX=$TOOLDIR -DBoost_NO_SYSTEM_PATHS=On -DBoost_NO_BOOST_CMAKE=On -DSPHINX_EXECUTABLE=$RE_PYTHON/bin/sphinx-build -DCMAKE_CXX_FLAGS="-std=c++11"

For tintin, I could not get the sphinx build stuff installed (very strange) so
I will just use the milou install.

    ON TINTIN:
    cmake .. -DCMAKE_INSTALL_PREFIX=$TOOLDIR -DBoost_NO_BOOST_CMAKE=On -DSPHINX_EXECUTABLE=$RE_PYTHON/../../milou/python-packages/bin/sphinx-build -DLEMON_ROOT_DIR="$MODULE_REQS/lemon-1.3.1/installdir" -DCMAKE_CXX_FLAGS="-std=c++11"

Now for both systems... this takes a long time.

    make

Must we create a dummy file and a directory or 'make install' will fail?

    touch /sw/apps/bioinfo/SeqAn/1.4.2/milou/seqan-1.4.2/extras/apps/seqan_flexbar/README
    mkdir /sw/apps/bioinfo/SeqAn/1.4.2/milou/seqan-1.4.2/build/docs/html

    make install


