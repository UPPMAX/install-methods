SeqTools/4.44.1
===============

Sanger Institute's SeqTools

<http://www.sanger.ac.uk/science/tools/seqtools>

LOG
---

    TOOL=/sw/apps/bioinfo/SeqTools
    cd $TOOL
    VERSION=4.44.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f seqtools-${VERSION}.tar.gz ]] || wget ftp://ftp.sanger.ac.uk/pub/resources/software/seqtools/PRODUCTION/seqtools-${VERSION}.tar.gz
    tar xzf seqtools-${VERSION}.tar.gz
    cd seqtools-$VERSION
    module load sqlite/3.16.2
    module load gcc/6.3.0
    ./configure --prefix=$PFX
    make all
    make install
    cd ..
    rm -rf seqtools-$VERSION

This provides a static library, and some header files, so set `LIBRARY_PATH` and `CPLUS_INCLUDE_PATH` in the mf file.

Documentation files are also provided in `$PFX/share/doc/seqtools`, add this to the mf file as well.

