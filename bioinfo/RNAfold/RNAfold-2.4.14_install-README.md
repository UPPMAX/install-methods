ViennaRNA/2.4.14
================

<http://www.tbi.univie.ac.at/RNA>

Also available as RNAfold/2.4.14


LOG
---

    VERSION=2.4.14
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/bioinfo/RNAfold
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    mkdir -p src
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src_$CLUSTER

    # the command substitution turns 2.4.14 into 2_4
    wget https://www.tbi.univie.ac.at/RNA/download/sourcecode/$(_v=${VERSION%.*}; _v=${_v//./_}; echo $_v)_x/ViennaRNA-${VERSION}.tar.gz
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
