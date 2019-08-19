blat/36
=======

Download source from https://users.soe.ucsc.edu/~kent/src/ and unzip.  Load
MariaDB in lieu of MySQL to allow building the database versions, but that is
only for finishing the build.  Also, build with the system gcc.

    cd /sw/bioinfo
    mkdir -p blat
    cd blat
    VERSION=36
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://hgwdev.gi.ucsc.edu/~kent/src/blatSrc${VERSION}.zip
    unzip blatSrc${VERSION}.zip
    cd blatSrc
    export MACHTYPE=x86_64
    module load MariaDB/10.1.29
    make BINDIR=$PFX

Everything is in `$PFX`.
