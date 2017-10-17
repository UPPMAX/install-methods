povray-3.7
=============

LOG
---

    VERSION=3.7
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/povray
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER source
    cd $CLUSTER
    PFX=$PWD
    cd ..
    git clone https://github.com/POV-Ray/povray.git source

    module load boost/1.63.0_intel17.1

    cd source/unix
    ./prebuild.sh
    cd ..
    ./configure COMPILED_BY="Marcus Holm <marcus.holm@uppmax.uu.se>" --prefix=$PFX --with-boost=$BOOST_ROOT
    make check && make install

