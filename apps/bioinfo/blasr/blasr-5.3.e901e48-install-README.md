blasr 5.3.e901e48
=================

Latest version of the PacBio aligner, built with the new pitchfork tool

<https://github.com/PacificBiosciences/pitchfork>

LOG
---

We will make this into `5.3`, but move it to its blasr version when done and create a link from the true version to `5.3`.

    VERSION=5.3
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/blasr
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src_$CLUSTER
    module load python/2.7.9
    module load gcc/5.3.0
    module load git/2.10.2
    git clone --recursive https://github.com/PacificBiosciences/pitchfork.git
    cd pitchfork/
    make PREFIX=$P blasr

This takes a long time, and adds a lot of files to the prefix directory.

    cd $P/bin
    LD_LIBRARY_PATH=$P/lib ./blasr --version
    cd ../../..
    mv 5.3 5.3.e901e48
    ln -s 5.3.e901e48 5.3

