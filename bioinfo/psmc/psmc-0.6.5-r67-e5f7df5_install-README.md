psmc/0.6.5-r67-e5f7df5
========================

<https://github.com/lh3/psmc>

Used under license:
MIT

LOG
---

    TOOL=psmc
    TOOLVERSION=0.6.5-r67
    COMMIT=e5f7df5
    VERSION=${TOOLVERSION}-${COMMIT}
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_${TOOL}_${VERSION}.sh

Structure creating script (makeroom_psmc_0.6.5-r67-e5f7df5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/psmc/makeroom_0.6.5-r67-e5f7df5.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    module load git/2.16.1
    module load gcc/8.3.0
    git clone https://github.com/lh3/psmc
    cd psmc
    git reset --hard $COMMIT
    make all
    make psmc.pdf
    cd utils
    make
    cd ..
    cp -av psmc psmc.pdf utils $PREFIX/

Now, in mf, include both `$PREFIX` and `$PREFIX/utils` in `PATH`.

