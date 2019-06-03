p7zip/16.02
===========

LOG
---

    VERSION=16.02
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps
    mkdir p7zip
    cd p7zip/
    ls ..
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER/
    PFX=$PWD
    cd ../
    mkdir src
    cd src
    wget https://downloads.sourceforge.net/project/p7zip/p7zip/${VERSION}/p7zip_${VERSION}_src_all.tar.bz2
    tar xvjf p7zip_${VERSION}_src_all.tar.bz2 
    cd p7zip_${VERSION}/

The default makefile is OK here.

### Added 2019-04-12

The default `make` target does not build everything we should be providing, as
it only provides the `7za` executable, not `7z` nor `7zr`.  Instead we should
build the `all3` target.

    make clean
    module load gcc/5.4.0
    make -j4 all3
    make test
    make test_7z
    make test_7zr
    make DEST_HOME=$PFX install


