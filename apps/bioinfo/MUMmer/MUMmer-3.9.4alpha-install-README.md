MUMmer 3.9.4alpha ('MUMmer4')
=============================

Fast sequence alignment

<https://github.com/gmarcais/mummer>

LOG
---

    VERSION=3.9.4alpha
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/MUMmer
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    P=$PWD/$CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/gmarcais/mummer/releases/download/v${VERSION}/mummer-${VERSION}.tar.gz
    module load gcc/5.4.0
    module load perl/5.18.4
    tar xzf mummer-${VERSION}.tar.gz 
    cd mummer-${VERSION}
    ./configure --prefix=$P
    make
    make install

Repeat for tintin.

The mf file now must add the gcc/5.4.0 library directories to `LD_LIBRARY_PATH`.

I don't know if it is necessary to load `perl/5.18.4`.  I hope not.

