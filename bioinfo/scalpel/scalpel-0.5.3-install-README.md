scalpel/0.5.3
=============

LOG
---

Unpack and build for cluster in place.

    cd /sw/apps/bioinfo/scalpel
    VERSION=0.5.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -f scalpel-${VERSION}.tar.gz ]] || wget https://downloads.sourceforge.net/project/scalpel/scalpel-${VERSION}.tar.gz
    tar xzf scalpel-${VERSION}.tar.gz 
    mv scalpel-${VERSION} $PFX
    cd $PFX
    module load perl/5.24.1
    module load gcc/5.4.0
    make
