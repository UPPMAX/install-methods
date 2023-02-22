boost/1.81.0-gcc10.3.0
======================

<https://www.boost.org/>

Used under license:
Boost licence
<http://www.boost.org/users/license.html>

Structure creating script (makeroom_boost_1.81.0-gcc10.3.0.sh) moved to /sw/libs/boost/makeroom_1.81.0-gcc10.3.0.sh

LOG
---

    TOOL=boost
    BOOSTVERSION=1.81.0
    GCCVERSION=10.3.0
    PYTHONVERSION=3.9.5
    VERSION=${BOOSTVERSION}-gcc${GCCVERSION}

    makeroom.sh -f -c "libs" -t "$TOOL" -v "$VERSION" -w "https://www.boost.org/" -l "Boost licence" -L "http://www.boost.org/users/license.html" -d "free peer-reviewed portable C++ source libraries"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    BOOSTTARBALLVERSION=${BOOSTVERSION//./_}
    BOOSTTARBALL=boost_${BOOSTTARBALLVERSION}.tar.bz2
    [[ -f $BOOSTTARBALL ]] || wget  https://boostorg.jfrog.io/artifactory/main/release/$BOOSTVERSION/source/$BOOSTTARBALL
    [[ -d boost_${BOOSTVERSION} ]] && rm -rf boost_${BOOSTVERSION}

    tar xf $BOOSTTARBALL
    mv boost_${BOOSTTARBALLVERSION} boost_${BOOSTVERSION}
    cd boost_${BOOSTVERSION}

    module load gcc/$GCCVERSION

    module load python/$PYTHONVERSION

    ./bootstrap.sh --with-toolset=gcc --prefix=$PREFIX

    ./b2
    ./b2 headers
    ./b2 install --prefix=$PREFIX

    cd ..
    rm -rf boost_${BOOSTVERSION}

