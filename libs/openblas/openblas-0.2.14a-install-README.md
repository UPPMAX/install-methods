openblas/0.2.14a
================

LOG
---

    VERSION=0.2.14a
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/libs/openblas/$VERSION/src
    cd /sw/libs/openblas/$VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/
    rm -rf xianyi-OpenBLAS-d0c51c4
    if [[ ! -f xianyi-OpenBLAS-v0.2.14-0-gd0c51c4.zip ]] ; then
        wget https://github.com/xianyi/OpenBLAS/zipball/master
        mv master xianyi-OpenBLAS-v0.2.14-0-gd0c51c4.zip
    fi
    unzip xianyi-OpenBLAS-v0.2.14-0-gd0c51c4.zip 
    cd xianyi-OpenBLAS-d0c51c4/
    make clean
    module load gcc/4.9.2

On any system, the `make clean` above must be done.  The zip has leftover
object files that will screw up the build; I found missing symbols in
`libopenblas_haswellp-r0.2.14.so` including `s_cat` and `dgamm_itcopy`.


On milou and irma3:

    make
    make PREFIX=$PFX install

On rackham, where CPU type cannot be determined automatically, the type is
Broadwell (Xeon E5 v4), which is a die shrink from Haswell, so use Haswell.
Also, rackham5 has hyperthreading enabled so set the number of cores
explicitly; this eventually sets `MAX_CPU_NUMBER` which is visible as the
compilation commands scroll by.

    make TARGET=HASWELL NUM_CORES=20
    make TARGET=HASWELL NUM_CORES=20 PREFIX=$PFX install

Remove the unzipped directory.

    cd ..
    rm -rf xianyi-OpenBLAS-d0c51c4

The irma build should be symlinked by `bianca`.
