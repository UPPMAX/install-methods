ANGSD/0.921
===========

Build using official release version, and the module version of htslib/1.6.
Also loaded gcc/6.3.0, zlib/1.2.8, bzip2/1.0.6, and xz/5.2.2.

LOG
---

    TOOL=/sw/apps/bioinfo/ANGSD
    VERSION=0.921
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER/{bin,misc}
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/ANGSD/angsd/archive/${VERSION}.tar.gz
    rm -rf angsd-${VERSION}
    tar xzf ${VERSION}.tar.gz
    cd angsd-${VERSION}
    module load gcc/6.3.0
    module load zlib/1.2.8
    module load bzip2/1.0.6
    module load xz/5.2.2
    module load bioinfo-tools
    module load htslib/1.6
    make
    cp angsd $PFX/bin/
    cp -rp R doc scripts $PFX/
    # adjust python used for execution
    find misc -type f -perm /1 -exec cp {} $PFX/misc/ \;
    sed -i 's,/usr/bin/python,/usr/bin/env python,' $PFX/misc/plot_psmc.py

