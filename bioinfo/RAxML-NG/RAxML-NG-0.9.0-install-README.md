RAxML-NG-0.9.0-install-README.md
================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Build non-MPI version.  Do not use precompiled, since we do not use precompiled MPI version.
We have to get the github repo because we need submodules `--recursive`.  Get just the tagged release with `--branch $VERSION`, and use `--depth 1` to download no history.

    VERSION=0.9.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src/
    module load git/2.16.1
    [[ -d raxml-ng ]] && rm -rf raxml-ng
    git clone --branch $VERSION --depth 1 --recursive https://github.com/amkozlov/raxml-ng
    cd raxml-ng
    module load cmake/3.7.2
    module load gcc/7.3.0
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make
    make install
    cd $PREFIX/bin
    ldd raxml-ng
    ./raxml-ng -h

