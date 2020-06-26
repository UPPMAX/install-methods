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
    cd /sw/apps/conda/latest
    unlink bianca
    mkdir bianca
    cd bianca
    cp -av ../rackham/.condarc .
    ln -s ../rackham/* .
    vim .condarc

From 4.7 there is a need to replace things in /sw/apps/conda/latest/rackham/lib/python3.7/site-packages/conda/core/subdir_data.py
At the following rows I inserted:

66         ## Due to extensive file handling 200401
67         ## if not cache_key[0].startswith('file://') and cache_key in SubdirData._cache_:
68         if cache_key in SubdirData._cache_:

