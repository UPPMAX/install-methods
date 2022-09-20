boost/1.79.0_gcc11.2.0_mpi4.1.2
========================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.79.0_gcc11.2.0_mpi4.1.2.sh) moved to /sw/libs/boost/makeroom_1.79.0_gcc11.2.0_mpi4.1.2.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh "-f" "-c" "libs" "-t" "boost" "-v" "1.79.0_gcc11.2.0_mpi4.1.2" "-w" "https://www.boost.org/" "-l" "Boost licence" "-L" "http://www.boost.org/users/license.html" "-d" "free peer-reviewed portable C++ source libraries"
    ./makeroom_boost_1.79.0_gcc11.2.0_mpi4.1.2.sh
boost/1.41.0_gcc9.3.0
========================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.41.0_gcc9.3.0.sh) moved to /sw/libs/boost/makeroom_1.41.0_gcc9.3.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh "-f" "-c" "libs" "-t" "boost" "-v" "1.41.0_gcc9.3.0" "-w" "https://www.boost.org/" "-l" "Boost licence" "-L" "http://www.boost.org/users/license.html" "-d" "free peer-reviewed portable C++ source libraries"
    ./makeroom_boost_1.41.0_gcc9.3.0.sh
boost/1.70.0_gcc9.3.0
========================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.70.0_gcc9.3.0.sh) moved to /sw/libs/boost/makeroom_1.70.0_gcc9.3.0.sh

LOG
---
    TOOL=boost
    BOOSTVERSION=1.70.0
    GCCVERSION=9.3.0
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}
    makeroom.sh -f -c "libs" -t "$TOOL" -v "$VERSION" -w "https://www.boost.org/" -l "Boost licence" -L "http://www.boost.org/users/license.html" -d "free peer-reviewed portable C++ source libraries"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    wget  https://boostorg.jfrog.io/artifactory/main/release/1.70.0/source/boost_1_70_0.tar.bz2
    tar xjf boost_${BOOSTTARBALLVERSION}.tar.bz2
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load gcc/$GCCVERSION

    ./bootstrap.sh --with-toolset=gcc --prefix=$PREFIX

    ./b2
    ./b2 install --prefix=$PREFIX

    cd ..
    rm -rf boost_${BOOSTVERSION}
