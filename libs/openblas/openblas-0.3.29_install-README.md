openblas/0.3.29
===============

<https://github.com/xianyi/OpenBLAS>

Used under license:
BSD 3-clause

Structure creating script (makeroom_openblas_0.3.29.sh) moved to /sw/libs/openblas/makeroom_0.3.29.sh

LOG
---

    TOOL=openblas
    VERSION=0.3.29
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -c "libs" -w "https://github.com/xianyi/OpenBLAS" -d "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version" -l "BSD 3-clause"

    ./makeroom_${TOOL}_${VERSION}.sh

    cd /sw/libs/openblas
    source SOURCEME_openblas_0.3.29
    TOOLVERSION=$VERSION

    cd $SRCDIR

    rm -rf OpenBLAS-$TOOLVERSION
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/xianyi/OpenBLAS/archive/v${TOOLVERSION}.tar.gz
    [[ -d OpenBLAS-${TOOLVERSION} ]] && rm -rf OpenBLAS-${TOOLVERSION}
    [[ -d OpenBLAS-${TOOLVERSION}_$CLUSTER ]] && rm -rf OpenBLAS-${TOOLVERSION}_$CLUSTER
    tar xf v${TOOLVERSION}.tar.gz
    mv OpenBLAS-${TOOLVERSION} OpenBLAS-${TOOLVERSION}_$CLUSTER
    cd OpenBLAS-${TOOLVERSION}_$CLUSTER
    module load gcc/13.3.0
    make clean
    case $CLUSTER in
        rackham) NUM_CORES=20 ;;
        snowy)   NUM_CORES=16 ;;
        bianca)  NUM_CORES=16 ;;
        miarka)  NUM_CORES=24 ;;
        *)       echo "$CLUSTER is unknown cluster"; exit 1 ;;
    esac
    make NUM_CORES=$NUM_CORES
    mkdir $PREFIX
    make NUM_CORES=$NUM_CORES PREFIX=$PREFIX install
    cd ..
    rm -rf OpenBLAS-$TOOLVERSION


I won't go through the effort of building separately on all systems.  Only on rackham.

At the end of the rackham build (r40) we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

      OS               ... Linux
      Architecture     ... x86_64
      BINARY           ... 64bit
      C compiler       ... GCC  (cmd & version : gcc (GCC) 13.3.0)
      Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 13.3.0)
      Library Name     ... libopenblas_haswellp-r0.3.29.a (Multi-threading; Max num-threads is 20)


