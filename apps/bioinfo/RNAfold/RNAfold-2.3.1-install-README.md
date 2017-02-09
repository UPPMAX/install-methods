# ViennaRNA-2.3.1-install-README.md

ViennaRNA/2.3.1

<http://www.tbi.univie.ac.at/RNA>

LOG
---

    VERSION=2.3.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/RNAfold
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    mkdir -p src_$CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src_$CLUSTER

Download, no apparent direct link so download to local computer and copy over.

    wget http://www.tbi.univie.ac.at/RNA/download/sourcecode/2_3_x/ViennaRNA-${VERSION}.tar.gz
    tar xzf ViennaRNA-${VERSION}.tar.gz 
    cd ViennaRNA-${VERSION}

See the install log for 2.2.5 for various reasons behind these choices.

    module load binutils/2.26
    module load texlive/2015
    module load doxygen/1.8.11
    module load swig/3.0.7
    module load python/2.7.6
    module load gcc/5.3.0

    ./configure  --with-cluster --with-kinwalker --prefix=$PREFIX

    make
    make install

And repeat for tintin.
