canu 1.3
========

Fork of Celera Assembler specialised for long noisy reads.

<http://canu.readthedocs.org/en/latest/>

Log
---

    VERSION=1.3
    CLUSTER=milou
    cd /sw/apps/bioinfo/canu
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    mkdir -p src
    cd src/
    wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
    module load gcc/5.3.0
    module load zlib/1.2.8
    tar xzf v${VERSION}.tar.gz 
    mv canu-${VERSION} canu-${VERSION}-$CLUSTER
    cd canu-${VERSION}-$CLUSTER
    cd src/
    make -j 8
    cd ..
    mv Linux-amd64 ../../$CLUSTER/

Repeat on tintin.

Use mf from 1.1.

