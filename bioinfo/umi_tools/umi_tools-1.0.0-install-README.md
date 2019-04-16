umi_tools/1.0.0
===============

Installs UMI-tools from:

<https://github.com/CGATOxford/UMI-tools>

The release 1.0.0 is available there, but there are four minor commits since
that release to the master branch that are little bug fixes for 1.0.0, so let's
go for that instead.

It also requires python>=3.5, so we'll use python/3.6.8.


LOG
---

Simple to install with `pip` and the `--user` trick setting `PYTHONUSERBASE` to the prefix.
This leaves us with no `src` directory, cleaner!

    VERSION=1.0.0
    PYTHONVERSION=3.6.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/umi_tools
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    git clone https://github.com/CGATOxford/UMI-tools.git
    cd UMI-tools
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip3 install --user .

Use mf file from 0.5.3.

