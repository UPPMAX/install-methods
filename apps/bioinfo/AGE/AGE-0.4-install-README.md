AGE/0.4
=======

Alignment around structural variants.

<https://github.com/abyzovlab/AGE>

LOG
---

    VERSION=0.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir AGE
    cd AGE
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -d AGE ]] || git clone https://github.com/abyzovlab/AGE
    cd AGE
    module load gcc/5.4.0

Make both with and without OMP support.

    make clean ; rm -f age_align
    make OMP=no
    mv age_align $PFX/
    make clean ; rm -f age_align
    make
    mv age_align $PFX/age_align_omp

