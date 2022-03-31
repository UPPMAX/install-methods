boost/1.78.0_gcc11.2.0
========================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.78.0_gcc11.2.0.sh) moved to /sw/libs/boost/makeroom_1.78.0_gcc11.2.0.sh

LOG
---

    TOOL=boost
    BOOSTVERSION=1.78.0
    GCCVERSION=11.2.0
    VERSION=${BOOSTVERSION}_gcc${GCCVERSION}

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

    ./bootstrap.sh --with-toolset=gcc --prefix=$PREFIX

    ./b2
    ./b2 install --prefix=$PREFIX

    cd ..
    rm -rf boost_${BOOSTVERSION}
