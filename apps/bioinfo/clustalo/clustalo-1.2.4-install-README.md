Clustal Omega: clustalo/1.2.4
=============

Using the standalone linux 64-bit binaries, which are (thank grool) statically linked.

    VERSION=1.2.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    TOOL=clustalo
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER/bin
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER/bin
    mkdir src
    cd src
    wget http://www.clustal.org/omega/clustalo-${VERSION}-Ubuntu-x86_64
    cp -av clustalo-${VERSION}-Ubuntu-x86_64 $PFX/clustalo
    chmod +x $PFX/clustalo

We can use the mf file from 1.2. Finally:

    fixup -g /sw/apps/bioinfo/clustalo


To compile from source, which I did not attempt, start with the 1.2 readme.

