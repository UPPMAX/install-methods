openblas/0.2.20-openmp
========================

<https://github.com/xianyi/OpenBLAS>

Used under license:
BSD 3-clause
<>

Structure creating script (makeroom_openblas_0.2.20-openmp.sh) moved to /sw/libs/openblas/makeroom_0.2.20-openmp.sh

LOG
---

    TOOL=openblas
    TOOLVERSION=0.2.20
    VERSION=${TOOLVERSION}-openmp

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -c "libs" -w "https://github.com/xianyi/OpenBLAS" -d "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version" -l "BSD 3-clause"

    ./makeroom_${TOOL}_${VERSION}.sh

    cd /sw/libs/${TOOL}
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    rm -rf OpenBLAS-$TOOLVERSION
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/xianyi/OpenBLAS/archive/v${TOOLVERSION}.tar.gz
    tar xf v${TOOLVERSION}.tar.gz
    cd OpenBLAS-$TOOLVERSION
    module load gcc/6.3.0
    make clean
    [[ $CLUSTER = rackham ]] && NUM_CORES=20 || NUM_CORES=16
    make USE_OPENMP=1 NUM_CORES=$NUM_CORES
    make USE_OPENMP=1 NUM_CORES=$NUM_CORES PREFIX=$PREFIX install
    cd ..
    rm -rf OpenBLAS-$TOOLVERSION


