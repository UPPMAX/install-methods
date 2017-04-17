patchelf/0.8
============


LOG
---

Simple install.

    cd /w/comp/
    cd patchelf/
    VERSION=0.8
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ..
    cd src
    cd patchelf-$VERSION
    make clean
    ./configure --prefix=$PREFIX
    make
    make install
    cd ../..
    ln -s ./rackham irma
    ln -s ./rackham bianca
