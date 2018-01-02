MariaDB/10.1.29
===============

<https://mariadb.com>

LOG
---

* I couldn't get installing the prebuilt binaries to work
* I also couldn't get a build in the source directory to work, hence the creation of `bbuild` directory for building
* Parallel `make`, such as `make -j 8`, doesn't work with these cmake-generated makefiles.  Shame.
* Do not build the TokuDB plugin, it wants to use an `ld` plugin that is not available with stock gcc

    TOOL=/sw/apps/MariaDB
    VERSION=10.1.29
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    [[ -f mariadb-${VERSION}.tar.gz ]] || wget https://downloads.mariadb.org/interstitial/mariadb-${VERSION}/source/mariadb-${VERSION}.tar.gz
    [[ -d mariadb-${VERSION} ]] || tar xzf mariadb-${VERSION}.tar.gz 
    cd mariadb-${VERSION}/
    rm -rf bbuild
    mkdir bbuild
    cd bbuild
    module load cmake/3.7.2
    module load gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2
    cmake .. -DPLUGIN_TOKUDB=NO -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_BOOST_CMAKE=ON
    make
    make install


