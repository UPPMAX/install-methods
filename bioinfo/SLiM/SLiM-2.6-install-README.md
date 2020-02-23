SLiM/2.6
==========

SLiM simulation platform.

<https://messerlab.org/slim/>

Builds with cmake, but requires special settings for `CMAKE_AR` and `CMAKE_RANLIB` when link-time optimisation is enabled.

LOG
---

    VERSION=2.6
    cd /sw/bioinfo
    TOOL=SLiM
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/MesserLab/SLiM/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd SLiM-${VERSION}
    module load gcc/7.4.0
    make
    cp -av bin $PREFIX/

    module unload gcc
    cd $PREFIX/bin
    ldd *
    ./slim -u
    ./slim -testEidos
    ./slim -testSLiM

