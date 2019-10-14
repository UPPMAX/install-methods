ALPS/2.3.0
========================

<http://alps.comp-phys.org/mediawiki/index.php/Main_Page>

Used under license:
ALPS Library License version 1.0, ALPS Application License version 1.0

Structure creating script (makeroom_ALPS_2.3.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/ALPS/makeroom_2.3.0.sh



The ALPS project (Algorithms and Libraries for Physics Simulations) is an open source effort aiming at providing high-end simulation codes for strongly correlated quantum mechanical systems as well as C++ libraries for simplifying the development of such code. ALPS strives to increase software reuse in the physics community.

This build procedure loads `gcc/7.3.0` and then `source`s an internal `intel/18.3` file to get the `intel/18.3` compiler running on top of the `gcc/7.3.0` compiler.


LOG
---

    TOOL=ALPS
    VERSION=2.3.0
    cd /sw/apps
    makeroom.sh -c apps -t $TOOL -v $VERSION -w http://alps.comp-phys.org/mediawiki/index.php/Main_Page -d "The ALPS project (Algorithms and Libraries for Physics Simulations) is an open source effort aiming at providing high-end simulation codes for strongly correlated quantum mechanical systems as well as C++ libraries for simplifying the development of such code." -l "ALPS Library License version 1.0, ALPS Application License version 1.0"
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    ./makeroom_4{TOOL}_${VERSION}.sh

    cd $VERSIONDIR
    cd src
    wget http://alps.comp-phys.org/static/software/releases/alps-${VERSION}-src-with-boost.tar.gz
    tar xzf alps-${VERSION}-src-with-boost.tar.gz 
    cd alps-${VERSION}-src-with-boost/
    SRCDIR=$PWD

The unpacked tarball contains two subdirectories: `alps` and `boost`.  Prepare for building, including making sure licences can be found.

    module load cmake/3.13.2
    module load python/2.7.15
    module load gcc/7.3.0
    source /sw/comp/intel/compilers_and_libraries_2018.3.222/linux/bin/compilervars.sh intel64 -platform linux
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses:$INTEL_LICENSE_FILE
    module load intelmpi/18.3
    module load hdf5/1.10.5-threadsafe-intel18.3

Build boost.  Make all the bash scripts executable first.

    mkdir boost_build
    BOOST_BUILD=$PWD/boost_build

    cd boost
    find . -name '*.sh' -exec chmod +x {} \;
    ./bootstrap.sh --prefix=$PREFIX --with-toolset=intel-linux

    vi project-config.jam

Add a line around line 26 that is after the line for `path-constant ICU_PATH`:

    using mpi : mpiicpc ;

This instructs it to use the intel mpi compiler for mpi portions.  After this is done, then continue the boost build.

    ./b2 --build-dir=$BUILD --prefix=$PREFIX toolset=intel-linux variant=release link=shared threading=multi
    ./b2 --build-dir=$BUILD --prefix=$PREFIX toolset=intel-linux variant=release link=shared threading=multi install

Now set `BOOST_ROOT` to our `PREFIX`, where this boost is now installed.


    export BOOST_ROOT=$PREFIX
    cd ..


Now build ALPS.

    cd alps/
    mkdir build
    cd build

These variable changes force alps to build with the intel compilers.
These are normally set by loading an `intel` module, but sourcing the file appears not to do this.

    CC=icc CXX=icpc FC=ifort F77=ifort cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBoost_NO_BOOST_CMAKE=ON 

    make
    make install


Now to get this set up properly for end users.  The boost used provides
libraries, include files, etc.  Does ALPS?  Yes, it provides
`lib/libalps.so.2.3.0` and the direcotry `include/alps/`.  So yes, this should
be set up for building against just like boost is, and it should set
`BOOST_ROOT` and conflict with boost modules.  I've provided the file
`$ALPS_ROOT/../ALPS-${VERSION}-build-settings.sh` to be `source`-d to recreate
this particular build environment, with `intel/18.3` on top of `gcc/7.3.0`.


