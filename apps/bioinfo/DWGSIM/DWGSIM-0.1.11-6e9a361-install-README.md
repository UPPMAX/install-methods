# DWGSIM-0.1.11-6e9a361-install-README.md

DWGSIM/0.1.11-6e9a361
=====================

DWGSIM simulated sequences from a whole genome.

<https://github.com/nh13/DWGSIM>

The versioning here reflects that this version is a `git clone` from the above,
which is several commits ahead of the 0.1.11 version.


LOG
---

    VERSION=0.1.11
    CLUSTER=${CLUSTER?:cluster must be set}
    cd /sw/apps/bioinfo
    mkdir -p DWGSIM
    cd DWGSIM
    mkdir $VERSION

Version will be adjusted later.

    cd $VERSION
    mkdir -p $CLUSTER
    mkdir -p src
    cd src

We need a newer `git` than is on the system to handle `--recursive`.

    module load git/2.5.0
    git clone --recursive https://github.com/nh13/DWGSIM
    cd DWGSIM/

Now to get number of latest commit, and adjust version.

    VERSION_ORIG=$VERSION
    VERSION=${VERSION}-$(git log --name-status --oneline | head -1 | cut -f1 -d' ')

    cd ../../..
    mv $VERSION_ORIG $VERSION
    cd $VERSION

    cd src
    cd DWGSIM/

Adjust the version in the tool itself to the new `$VERSION` within the `Makefile`.

    vi Makefile 

Compile, copy files to `$CLUSTER`.

    module load gcc/5.3.0
    make
    ldd dwgsim
    cp -a dwgsim* ../../$CLUSTER

Recompile for tintin.

Very simple mf, modified from samtools.

