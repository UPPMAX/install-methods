JasPer/2.0.14
=============

Image-processing library.

LOG
---


    cd /sw/libs
    mkdir JasPer
    cd JasPer
    mkdir mf
    VERSION=2.0.14
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/mdadams/jasper/archive/version-$VERSION.tar.gz
    tar xzf version-$VERSION.tar.gz
    cd jasper-version-$VERSION
    module load cmake/3.7.2
    module load texlive/2018
    module load doxygen/1.8.11
    mkdir cmakebuilddir
    cd cmakebuilddir/

Build the shared library.

    cmake -G "Unix Makefiles" .. -DCMAKE_INSTALL_PREFIX=$PFX -DJAS_ENABLE_SHARED=true -DJAS_ENABLE_DOC=true -DCMAKE_BUILD_TYPE=Release 
    make
    make install

Build the static library.

    cmake -G "Unix Makefiles" .. -DCMAKE_INSTALL_PREFIX=$PFX -DJAS_ENABLE_SHARED=false -DJAS_ENABLE_DOC=true -DCMAKE_BUILD_TYPE=Release 
    make
    make install

