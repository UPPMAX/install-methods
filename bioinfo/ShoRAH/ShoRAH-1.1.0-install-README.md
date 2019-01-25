ShoRAH/1.1.0
============

ShoRAH is an open source project for the analysis of next generation sequencing
data. It is designed to analyse genetically heterogeneous samples. Its tools
are written in different programming languages and provide error correction,
haplotype reconstruction and estimation of the frequency of the different
genetic variants present in a mixed sample.

<http://www.biomedcentral.com/1471-2105/12/119>

<https://github.com/cbg-ethz/shorah>

<http://cbg-ethz.github.io/shorah/>


LOG
---

We will install numpy and Biopython into this virtualenv, rather than use
module versions.  After installation, the `$PFX` directory takes up just 50
MiB.

    VERSION=1.1.0
    TOOL=/sw/apps/bioinfo/ShoRAH
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f shorah-${VERSION}.tar.bz2 ]] || wget https://github.com/cbg-ethz/shorah/releases/download/v${VERSION}/shorah-${VERSION}.tar.bz2
    tar xjf shorah-${VERSION}.tar.bz2
    module load python/3.4.3
    module load gcc/6.3.0
    module load gsl/2.3
    pyvenv $PFX
    cd $PFX/bin/
    ./pip install numpy
    ./pip install Biopython
    cd ../../src/shorah-$VERSION
    ./configure --prefix=$PFX PYTHON=$PFX/bin/python3.4
    make -j 4
    make install
    cd ..
    rm -rf shorah-$VERSION

Now 'hide' the pyvenv executables, except for python3.4 which the scripts are
using.

    cd $PFX/bin
    for F in easy_install easy_install-3.4 pip pip3 pip3.4 python python3 f2py3.4 ; do mv $F _$F; done

