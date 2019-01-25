accuMUlate/0.2.1-b5843db
========================

Bug-fixed version of <https://github.com/dwinter/accuMUlate>.

LOG
===

    TOOL=accuMUlate
    VERSION=0.2.1
    COMMIT_HASH=b5843db556b63378c4738bbbe89c6b024b95807f
    LOCALVERSION=$VERSION-${COMMIT_HASH:0:7}
    cd /sw/apps/bioinfo
    mkdir $TOOL
    cd $TOOL
    mkdir $LOCALVERSION
    cd $LOCALVERSION
    mkdir src
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER

    module load git/2.16.1

    cd src
    git clone https://github.com/douglasgscofield/accuMUlate.git
    cd accuMUlate
    git reset --hard b5843db556b63378c4738bbbe89c6b024b95807f

    module load cmake/3.7.2
    module load gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2

    module load bioinfo-tools
    #  must use older bamtools/2.3.0
    module load bamtools/2.3.0  # -DBamtools_PREFIX=$BAMTOOLS_ROOT

    module load Eigen/3.3.4     # -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include/eigen3

    [[ -d build ]] && rm -rf build
    mkdir build
    cd build

    LIBRARY_PATH= cmake -DBoost_NO_BOOST_CMAKE=ON -DBamtools_PREFIX=$BAMTOOLS_ROOT -DEIGEN3_INCLUDE_DIR=$EIGEN_ROOT/include/eigen3 -DCMAKE_INSTALL_PREFIX=$PFX ..
    make
    cp -av accuMUlate denominate $PFX/
    cd ../..

Get the tools.

    git clone https://github.com/dwinter/accuMulate-tools
    cd accuMulate-tools
    sed -i 's,#!/usr/bin/python,#!/usr/bin/env python,' *.py
    chmod +x *.py
    cp -av *.py $PFX/

The mf file should load biopython/1.68

