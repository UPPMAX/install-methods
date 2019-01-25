NextGenMap/0.5.4
================

NextGenMap short read mapping program

NextGenMap: fast and accurate read mapping in highly polymorphic genomes; Fritz
J. Sedlazeck, Philipp Rescheneder, Arndt von Haeseler; Bioinformatics, Vol. 29,
No. 21. (1 November 2013), pp. 2790-2791, doi:10.1093/bioinformatics/btt468


<http://cibiv.github.io/NextGenMap/>

Add /sw/apps/bioinfo/NextGenMap/${VERSION}/milou to user PATH and
/sw/apps/bioinfo/NextGenMap/${VERSION}/milou/opencl/lib to user LD_LIBRARY_PATH

LOG
---

    TOOL=/sw/apps/bioinfo/NextGenMap
    VERSION=0.5.4
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/Cibiv/NextGenMap/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd NextGenMap-${VERSION}
    mkdir -p build
    cd build
    module load cmake/3.7.2
    module load gcc/6.3.0
    cmake ..
    make
    cd ../bin/ngm-${VERSION}
    mv * $PFX/
    cd ../../..
    rm -rf NextGenMap-${VERSION}

