minimap2/2.17-r941
========================

<https://github.com/lh3/minimap2>

Used under license:

<>

Structure creating script (makeroom_minimap2_2.17-r941.sh) moved to /sw/bioinfo/minimap2/makeroom_2.17-r941.sh

LOG
---

    TOOL=minimap2
    VERSION=2.17-r941
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/minimap2/2.17-r941/src
    /home/douglas/bin/makeroom.sh -f" -t "minimap2" -v "2.17-r941" -s "alignment" -w "https://github.com/lh3/minimap2" -d "versatile pairwise aligner for genomic and spliced nucleotide sequences"
    ./makeroom_minimap2_2.17-r941.sh
minimap2/2.16
============

<https://github.com/lh3/minimap2>


LOG
---

    TOOL=/sw/bioinfo/minimap2
    VERSION=2.16
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER
    PFX=$PWD
    mkdir -p bin man/man1
    cd ../src
    [[ -f minimap2-${VERSION}.tar.bz2 ]] || wget https://github.com/lh3/minimap2/releases/download/v${VERSION}/minimap2-${VERSION}.tar.bz2
    tar xjf minimap2-${VERSION}.tar.bz2
    cd minimap2-${VERSION}
    module load gcc/7.4.0
    make
    cp -av minimap2 $PFX/bin/
    cp -av minimap2.1 $PFX/man/man1/
    cd ..
    rm -rf minimap2-${VERSION}

