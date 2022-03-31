boost/1.78.0_gcc11.2.0_mpi4.1.2
========================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.78.0_gcc11.2.0_mpi4.1.2.sh) moved to /sw/libs/boost/makeroom_1.78.0_gcc11.2.0_mpi4.1.2.sh

LOG
---

    TOOL=boost
    BOOSTVERSION=1.78.0
    GCCVERSION=11.2.0
    MPIVERSION=4.1.2
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}_mpi${MPIVERSION}
    
   makeroom.sh -f -c "libs" -t "$TOOL" -v "$VERSION" -w "https://www.boost.org/" -l "Boost licence" -L "http://www.boost.org/users/license.html" -d "free peer-reviewed portable C++ source libraries"

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    wget https://boostorg.jfrog.io/artifactory/main/release/${BOOSTVERSION}/source/boost_${BOOSTTARBALLVERSION}.tar.bz2
    tar xjf boost_${BOOSTTARBALLVERSION}.tar.bz2
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load gcc/$GCCVERSION
    module load openmpi/$MPIVERSION

    ./bootstrap.sh --with-toolset=gcc --prefix=$PREFIX

For MPI, follow <http://www.boost.org/doc/libs/1_78_0/doc/html/mpi/getting_started.html#mpi.config> and add

    using mpi ;

around line 26 of the file `project-config.jam` file created by the bootstrap process
(at least after the 'using gcc' and 'using python' lines).  Then continue.

    ./b2
    ./b2 install --prefix=$PREFIX

    cd ..
    rm -rf boost_${BOOSTVERSION}
