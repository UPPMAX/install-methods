CGATOxford CGAT tools
===========

https://github.com/CGATOxford/CGAT

LOG
---

Simple to install with `pip`.

    TOOL=CGAT
    VERSION=0.3.3
    PYTHONVERSION=3.6.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/CGAT/
    TOOLDIR=$PWD
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src
    cd src
    curl -O https://raw.githubusercontent.com/CGATOxford/cgat/master/install-CGAT-tools.sh
    SRCDIR=$PWD
    cd ..
    mkdir ${CLUSTER}
    [[ "$CLUSTER" = "rackham" ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    cd ${CLUSTER}/
    PFX=$PWD
    bash $SRCDIR/install-CGAT-tools.sh --production --location $PFX
    
First install do the foolowing instalation steps

    mkdir /sw/mf/common/bioinfo-tools/misc/CGAT
    cp mf/$VERSION /sw/mf/common/bioinfo-tools/misc/CGAT/
