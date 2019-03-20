SLiM/3.2.1
==========

SLiM simulation platform.

<https://messerlab.org/slim/>

Builds with cmake, but requires special settings for `CMAKE_AR` and `CMAKE_RANLIB` when link-time optimisation is enabled.

LOG
---

    VERSION=3.2.1
    cd /sw/bioinfo
    TOOL=SLiM
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/MesserLab/SLiM/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd SLiM-${VERSION}
    module load cmake/3.13.2 gcc/7.4.0
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PFX -DCMAKE_AR=$(which gcc-ar) -DCMAKE_RANLIB=$(which gcc-ranlib) ..
    make
    make install

Now check to see if it can find libraries, and test the tools.

    module unload cmake gcc
    cd $PFX
    ldd *
    ./slim -u
    ./slim -testEidos
    ./slim -testSLiM

