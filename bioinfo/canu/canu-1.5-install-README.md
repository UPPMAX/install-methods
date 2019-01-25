canu 1.5
========

Fork of Celera Assembler specialised for long noisy reads.

<http://canu.readthedocs.org/en/latest/>

Log
---

    VERSION=1.5
    CLUSTER=milou
    cd /sw/apps/bioinfo/canu
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    mkdir -p src
    cd src/
    wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
    module load gcc/6.3.0
    module load zlib/1.2.11
    tar xzf v${VERSION}.tar.gz 
    mv canu-${VERSION} canu-${VERSION}-$CLUSTER
    cd canu-${VERSION}-$CLUSTER
    cd src/
    make -j 8
    cd ..
    mv Linux-amd64 ../../$CLUSTER/

Repeat on rackham but I skipped loading zlib since the system is reasonably new.

Use mf from 1.1.

Note that `$CLUSTER/Linux-amd64/bin/canu.defaults` now contains an additional line `useGrid=false`.

