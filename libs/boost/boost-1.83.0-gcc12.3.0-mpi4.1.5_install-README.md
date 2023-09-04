boost/1.83.0-gcc12.3.0-mpi4.1.5
===============================

Build boost with GCC tool stack.

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.83.0-gcc12.3.0-mpi4.1.5.sh) moved to /sw/libs/boost/makeroom_1.83.0-gcc12.3.0-mpi4.1.5.sh

To configure for MPI build, we follow https://www.boost.org/doc/libs/1_83_0/doc/html/mpi/getting_started.html

LOG
---

    TOOL=boost
    BOOSTVERSION=1.83.0
    GCCVERSION=12.3.0
    PYTHONVERSION=3.10.8
    MPIVERSION=4.1.5
    VERSION=${BOOSTVERSION}-gcc${GCCVERSION}-mpi${MPIVERSION}
    VERSION_withoutMPI=${BOOSTVERSION}-gcc${GCCVERSION}

    makeroom.sh -f -c "libs" -t "$TOOL" -v "$VERSION" -w "https://www.boost.org/" -l "Boost licence" -L "http://www.boost.org/users/license.html" -d "free peer-reviewed portable C++ source libraries"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    BOOSTTARBALL=boost_${BOOSTTARBALLVERSION}.tar.bz2
    [[ -f $BOOSTTARBALL ]] || cp -av ../../$VERSION_withoutMPI/src/$BOOSTTARBALL . || wget  https://boostorg.jfrog.io/artifactory/main/release/$BOOSTVERSION/source/$BOOSTTARBALL
    [[ -d boost_${BOOSTVERSION} ]] && rm -rf boost_${BOOSTVERSION}

    tar xf $BOOSTTARBALL
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load gcc/$GCCVERSION

    module load openmpi/$MPIVERSION

    module load python/$PYTHONVERSION

    ./bootstrap.sh --with-toolset=gcc --prefix=$PREFIX

To configure for MPI build, we follow https://www.boost.org/doc/libs/1_83_0/doc/html/mpi/getting_started.html

    using mpi ;

around line 26 of the file `project-config.jam` file created by `./bootstrap.sh`,
at least after the 'using gcc' and 'using python' lines.  Then continue.  We build
here without multithreading, which might or might not matter.

    ./b2
    ./b2 headers
    ./b2 install --prefix=$PREFIX

    cd ..
    rm -rf boost_${BOOSTVERSION}

