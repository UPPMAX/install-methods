conda/latest
========================

<https://docs.conda.io/en/latest/miniconda.html>

Used under license:
© Copyright 2017, Anaconda, Inc. Revision 6be5194b.

Structure creating script (makeroom_conda_latest.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/conda/makeroom_latest.sh

LOG
---

    TOOL=conda
    VERSION=latest
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    ./makeroom_conda_latest.sh
    rm -rf $PREFIX
    cd /sw/apps/$TOOL/$VERSION/src
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh
    <ENTER>
    yes <ENTER>
    /sw/apps/conda/latest/rackham <ENTER>
    <ENTER>
    /sw/apps/conda/latest/rackham/bin/conda install conda-build
    /sw/apps/conda/latest/rackham/bin/conda update conda
    /sw/apps/conda/latest/rackham/bin/conda update conda-build
    /sw/apps/conda/latest/rackham/bin/conda install conda-mirror -c conda-forge
