# cmake-3.7.2-install-README.md

<https://cmake.org/>

LOG
---
Fetch (once)
    TOOL=/sw/apps/build/cmake
    VERS=3.7.2
    mkdir -p $VERS/src
    cd $VERS/src
    wget https://cmake.org/files/v${VERS%.*}/cmake-$VERS.tar.gz

Prep (for each cluster)
    module load gcc/6.3.0
    cd /sw/apps/build/cmake/$VERS
    mkdir $CLUSTER
    cd src
    tar xzf cmake-$VERS.tar.gz 
    cd cmake-$VERS
Make (for each cluster)
    ./bootstrap --prefix=/sw/apps/build/cmake/$VERS/$CLUSTER
    make
    make install

Could keep each install folder (suffixed with $CLUSTER), 
reuse (after "make clean") or delete (easy but may loose information).
