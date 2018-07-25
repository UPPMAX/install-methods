Eigen/3.3.4
===========

LOG
---

    VERSION=3.3.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs/Eigen
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    module load git/2.10.2
    module load cmake/3.7.2
    module load gcc/6.3.0
    [[ -f $VERSION.tar.bz2 ]] || wget http://bitbucket.org/eigen/eigen/get/$VERSION.tar.bz2
    TARDIR=eigen-eigen-5a0156e40feb
    [[ -d $TARDIR ]] && rm -rf $TARDIR
    tar xjf $VERSION.tar.bz2
    cd $TARDIR
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PFX ..
    make install

