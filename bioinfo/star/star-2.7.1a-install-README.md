STAR/2.7.1a
===========

<https://github.com/alexdobin/STAR>

Looked for additional secondary targets such as STARlong, didn't find them.
Only targets for static versions, debugging versions, and Mac version.
STARsolo appears to be activated with specific options to STAR itself.


LOG
---

    VERSION=2.7.1a
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    mkdir -p /sw/bioinfo/star
    cd /sw/bioinfo/star
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    wget https://github.com/alexdobin/STAR/archive/$VERSION.tar.gz
    tar -xzf $VERSION.tar.gz
    cd STAR-$VERSION
    module load gcc/7.4.0

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

