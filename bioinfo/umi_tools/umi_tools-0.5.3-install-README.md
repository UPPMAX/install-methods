umi_tools/0.5.3
===============

Installs UMI-tools from:

<https://github.com/CGATOxford/UMI-tools>

LOG
---

Simple to install with `pip` and the `--user` trick setting `PYTHONUSERBASE` to the prefix.
This leaves us with no `src` directory, cleaner!

    VERSION=0.5.3
    PYTHONVERSION=2.7.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/umi_tools/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user umi_tools==$VERSION
    mkdir /sw/mf/common/bioinfo-tools/misc/umi_tools
    cp mf/$VERSION /sw/mf/common/bioinfo-tools/misc/umi_tools/

