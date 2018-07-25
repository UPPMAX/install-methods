CGATOxford UMI-tools cgat
===========

https://github.com/CGATOxford

LOG
---

Simple to install with `pip`.

    VERSION=0.5.3
    PYTHONVERSION=2.7.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/boinfo/umi_tools/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC ; done
    cd ${CLUSTER}/
    PFX=$PWD
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PFX pip install --user umi_tools==$VERSION
    mkdir /sw/mf/common/bioinfo-tools/misc/umi_tools
    cp mf/$VERSION /sw/mf/common/bioinfo-tools/misc/umi_tools/
