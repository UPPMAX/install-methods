blasr/5.3-20171117-f72428d
=================

Latest version of the PacBio aligner, built with the new pitchfork tool

<https://github.com/PacificBiosciences/pitchfork>

LOG
---

This takes a long time, and adds a lot of files to the prefix directory.
Remove the source tree when done.

    VERSION=5.3-20171117-f72428d
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/blasr
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    module load python/2.7.9
    module load gcc/5.3.0
    module load git/2.10.2
    git clone --recursive https://github.com/PacificBiosciences/pitchfork.git
    cd pitchfork/
    make PREFIX=$PFX blasr
    cd $PFX/bin
    LD_LIBRARY_PATH=$PFX/lib ./blasr --version

    cd $TOOL/$VERSION
    rm -rf src_$CLUSTER
