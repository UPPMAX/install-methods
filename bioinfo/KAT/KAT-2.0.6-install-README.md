KAT 2.0.6
=========

K-mer Analysis Toolkit

<https://github.com/TGAC/KAT>

LOG
---

Begin setup on milou.

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    [[ "$CLUSTER" == "milou" ]] || { echo 'CLUSTER must be milou to begin'; exit 1; }

Continue.

    VERSION=2.0.6
    cd /sw/apps/bioinfo
    mkdir -p KAT
    cd KAT
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd src
    wget https://github.com/TGAC/KAT/releases/download/Release-${VERSION}/kat-${VERSION}.tar.gz
    tar xzf kat-${VERSION}.tar.gz 
    cd kat-${VERSION}/
    module load gcc/4.9.2
    ./configure --prefix=/sw/apps/bioinfo/KAT/${VERSION}/milou --with-boost=/sw/apps/build/boost/1.59.0_gcc4.9.2/milou/
    make
    make install

Now make sure the executables can find their libraries.

    cd ../../milou/bin
    ldd jellyfish 
    ldd kat 

And for tintin:

    make clean
    ./configure --prefix=/sw/apps/bioinfo/KAT/${VERSION}/tintin --with-boost=/sw/apps/build/boost/1.59.0_gcc4.9.2/tintin/
