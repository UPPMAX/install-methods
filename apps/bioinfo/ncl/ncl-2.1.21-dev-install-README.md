ncl/2.1.21-dev
==============

<https://github.com/mtholder/ncl>

LOG
---

    VERSION=2.1.21-dev
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/ncl/$VERSION
    cd /sw/apps/bioinfo/ncl/$VERSION
    mkdir -p $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    SRC=$PWD
    if [[ ! -d ncl ]] ; then
        ( module load git/2.10.2; git clone https://github.com/mtholder/ncl )
    fi
    cd ncl/
    module load gcc/5.3.0
    sh bootstrap.sh 
    rm -rf build
    mkdir build
    cd build
    ../configure --prefix=$PFX --with-constfuncs

That config option sets -DNCL_CONST_FUNCS which forces const-correctness.  This
must also be specified with subsequent builds against ncl, e.g., garli.

    make
    make check
    make install
    make installcheck

Also add a neat little utility I learned about from Garli:

    cp example/gapcode/.libs/NEXUSgapcode $PFX/bin/

Remote build tree.

    cd $SRC/ncl
    rm -rf build

The original mf included directories for the gcc libraries, but that does not
seem necessary, RPATH information includes what is needed.
