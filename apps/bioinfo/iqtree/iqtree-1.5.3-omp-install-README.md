iqtree/1.5.3-omp
================

IQ-TREE, providing both OMP and single-core versions

<http://www.iqtree.org/>

<http://www.iqtree.org/doc/Compilation-Guide/>

LOG
---

The tool has one version, the module has an -omp suffix, hence `VERSIONTOOL` and `VERSION`.

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/iqtree
    VERSIONTOOL=1.5.3
    VERSION=${VERSIONTOOL}-omp
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir -p $CLUSTER/bin src
    cd src

Can we use the precompiled version?

    wget https://github.com/Cibiv/IQ-TREE/releases/download/v${VERSIONTOOL}/iqtree-omp-${VERSIONTOOL}-Linux.tar.gz

    tar xvzf iqtree-omp-${VERSIONTOOL}-Linux.tar.gz 
    cd iqtree-omp-${VERSIONTOOL}-Linux/
    cd bin
    ldd iqtree-omp 
    ./iqtree-omp 

        FATAL: kernel too old
        Segmentation fault (core dumped)

Nope!  Remove the prebuilt binaries.

    cd ../..
    rm -rf iqtree-omp-${VERSIONTOOL}-Linux.tar.gz iqtree-omp-${VERSIONTOOL}-Linux

Now, build from source, first the OMP version.

    module load cmake/3.5.1
    module load gcc/6.3.0
    [[ -f v1.5.3.tar.gz ]] || wget https://github.com/Cibiv/IQ-TREE/archive/v1.5.3.tar.gz 
    rm -rf IQ-TREE-1.5.3
    tar xvzf v1.5.3.tar.gz 
    cd IQ-TREE-1.5.3/
    mkdir build_omp
    cd build_omp/
    cmake -DIQTREE_FLAGS=omp ..
    make -j8
    cp iqtree-omp ../../../$CLUSTER/bin/

Now the single-core version.

    cd ..
    mkdir build
    cd build
    cmake  ..
    make -j8
    cp iqtree ../../../$CLUSTER/bin/

Repeat for rackham.

