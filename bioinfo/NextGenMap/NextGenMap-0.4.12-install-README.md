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
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    PFX=$VERSIONDIR/$CLUSTER
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir -p src
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget http://github.com/Cibiv/NextGenMap/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd NextGenMap-${VERSION}
    mkdir -p build/release
    cd build/release/
    cmake -DCMAKE_BUILD_TYPE=Release ../..
    make

Executables are now in ../../bin/ngm-${VERSION}/ so test with

    ../../bin/ngm-${VERSION}/ngm

Rename the executable directory to the cluster directory.

    cd ../../bin
    mv ngm-${VERSION} $PFX
    cd ../..
    rm -rf NextGenMap-${VERSION}

Now create mf with above requirements for PATH and LD_LIBRARY_PATH.

