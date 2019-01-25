STAR/2.5.3a
===========

    VERSION=2.5.3a
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    cd /sw/apps/bioinfo/star
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER

Download the 

    wget https://github.com/alexdobin/STAR/archive/$VERSION.tar.gz
    tar -xzf $VERSION.tar.gz
    cd STAR-$VERSION

Load the rquired modules

    module load gcc/4.9.2

top-level Makefile does not have alternative targets

    cd source
    make -j4
    mkdir -p $PFX/bin
    cp -av STAR $PFX/bin
    make clean                     # clean is incomplete
    ( cd htslib ; make clean )     # second clean includes cram subfolder
    make STARlong
    cp -av STARlong $PFX/bin

    cd $PFX/bin
    ln -s STAR star
    ln -s STARlong starlong
