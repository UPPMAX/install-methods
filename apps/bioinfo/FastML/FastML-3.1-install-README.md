FastML/3.1
==========

<http://fastml.tau.ac.il/>

LOG
---

    VERSION=3.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir FastML
    cd FastML/
    mkdir mf ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    cd src
    wget http://fastml.tau.ac.il/source/FastML.v${VERSION}.tgz
    tar xzvf FastML.v${VERSION}.tgz 
    cd FastML.v${VERSION}/
    module load gcc/4.9.2
    make
    mkdir bin
    make install
    cd ..
    mv FastML.v${VERSION} ../$CLUSTER


