cyvcf2/0.8.8
============

<https://github.com/brentp/cyvcf2>

LOG
---

    VERSION=0.8.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir cyvcf2
    cd cyvcf2/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/brentp/cyvcf2/archive/v${VERSION}.tar.gz
    [[ -d cyvcf2-${VERSION} ]] && rm -rf cyvcf2-${VERSION}
    tar xzf v${VERSION}.tar.gz
    cd cyvcf2-${VERSION}
    module load python/2.7.11
    PYTHONUSERBASE=$PFX pip install --user .
    cd ..
    rm -rf cyvcf2-${VERSION}
