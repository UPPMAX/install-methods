garli/2.1
=========

LOG


    mkdir -p /sw/apps/bioinfo/garli/2.1
    cd /sw/apps/bioinfo/garli/2.1
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src

Garli is in a Google Code repository, but a github user has it cloned (so do I, now).

    [[ -d garli ]] || git clone https://github.com/Ashod/garli
    cd garli
    make clean
    module load gcc/4.9.2
    module load bioinfo-tools ncl/2.1.21-dev

This sets LD_RUN_PATH for ncl.

    sh bootstrap.sh 
    ./configure --prefix=$PFX --with-ncl=/sw/apps/bioinfo/ncl/2.1.21-dev/$CLUSTER
    vi config.h

Add this early in the file config.h:

    typedef long intptr_t;

Now build:

    make
    make install
    make clean

One final thing done by the build_garli.sh script.

    cp -av /sw/apps/bioinfo/ncl/2.1.21-dev/$CLUSTER/bin/NEXUSgapcode $PFX/bin/
