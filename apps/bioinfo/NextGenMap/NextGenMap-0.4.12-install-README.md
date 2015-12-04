# NextGenMap-0.4.12-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    NextGenMap 0.4.12

DESCRIPTION
-----------

    NextGenMap short read mapping program

    NextGenMap: fast and accurate read mapping in highly polymorphic genomes; Fritz
    J. Sedlazeck, Philipp Rescheneder, Arndt von Haeseler; Bioinformatics, Vol. 29,
    No. 21. (1 November 2013), pp. 2790-2791, doi:10.1093/bioinformatics/btt468


WEBSITE
-------

    http://cibiv.github.io/NextGenMap/

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/NextGenMap/0.4.12/milou to user PATH and
    /sw/apps/bioinfo/NextGenMap/0.4.12/milou/opencl/lib to user LD_LIBRARY_PATH

LOG
---

    TOOL=/sw/apps/bioinfo/NextGenMap
    VERSION=0.4.12
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $VERSIONDIR
    cd $TOOL
    mkdir -p mf src
    cd src
    wget http://github.com/Cibiv/NextGenMap/archive/v0.4.12.tar.gz
    tar xzf v0.4.12.tar.gz
    cd NextGenMap-0.4.12
    mkdir -p build/release
    cd build/release/
    cmake -DCMAKE_BUILD_TYPE=Release ../..
    make

Executables are now in ../../bin/ngm-0.4.12/ so test with

    ../../bin/ngm-0.4.12/ngm

Rename the executable directory to the cluster directory.

    cd ../../bin
    mv ngm-0.4.12 $VERSIONDIR/$CLUSTER

Now create mf with above requirements for PATH and LD_LIBRARY_PATH.

