vt 0.5772
=========

Tool for finding small variants

<http://genome.sph.umich.edu/wiki/Vt>

<https://github.com/atks/vt>

LOG
---

    cd /sw/apps/bioinfo
    mkdir vt
    cd vt
    VERSION=0.5772
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/atks/vt/archive/${VERSION}.tar.gz
    tar xzf 0.5772.tar.gz 
    cd vt-${VERSION}
    module load gcc/5.3.0
    make -j 8
    make test

Make sure no shared object requirements.

    module unload gcc
    ldd vt

Install.

    cp vt ../../$CLUSTER

Use mf from kallisto.

    cp ../../kallisto/mf/0.43.0 $VERSION
    vi $VERSION
