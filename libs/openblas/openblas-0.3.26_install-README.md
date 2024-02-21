openblas/0.3.26
===============

<https://github.com/xianyi/OpenBLAS>

Used under license:
BSD 3-clause

Structure creating script (makeroom_openblas_0.3.26.sh) moved to /sw/libs/openblas/makeroom_0.3.26.sh

LOG
---

    makeroom.sh -f -t "$TOOL" -v "$VERSION" -c "libs" -w "https://github.com/xianyi/OpenBLAS" -d "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version" -l "BSD 3-clause"

    ./makeroom_${TOOL}_${VERSION}.sh

    cd /sw/libs/openblas
    source SOURCEME_openblas_0.3.26
    TOOLVERSION=$VERSION

    cd $SRCDIR

    rm -rf OpenBLAS-$TOOLVERSION
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/xianyi/OpenBLAS/archive/v${TOOLVERSION}.tar.gz
    [[ -d OpenBLAS-${TOOLVERSION} ]] && rm -rf OpenBLAS-${TOOLVERSION}
    [[ -d OpenBLAS-${TOOLVERSION}_$CLUSTER ]] && rm -rf OpenBLAS-${TOOLVERSION}_$CLUSTER
    tar xf v${TOOLVERSION}.tar.gz
    mv OpenBLAS-${TOOLVERSION} OpenBLAS-${TOOLVERSION}_$CLUSTER
    cd OpenBLAS-${TOOLVERSION}_$CLUSTER
    module load gcc/12.3.0
    make clean
    case $CLUSTER in
        rackham) NUM_CORES=20 ;;
        snowy)   NUM_CORES=16 ;;
        bianca)  NUM_CORES=16 ;;
        miarka)  NUM_CORES=48 ;;
        ### miarka)  NUM_CORES=24 ;;  # compute nodes seem to have hyperthreading enabled
        *)       echo "$CLUSTER is unknown cluster"; exit 1 ;;
    esac
    make NUM_CORES=$NUM_CORES
    mkdir $PREFIX
    make NUM_CORES=$NUM_CORES PREFIX=$PREFIX install
    cd ..
    rm -rf OpenBLAS-$TOOLVERSION


Build separately for all four systems. On bianca, build through the wharf. On miarka, build in an interactive job but in my miarka home directory.


At the end of the rackham build (r484) we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

     OS               ... Linux
     Architecture     ... x86_64
     BINARY           ... 64bit
     C compiler       ... GCC  (cmd & version : gcc (GCC) 12.3.0)
     Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 12.3.0)
     Library Name     ... libopenblas_haswellp-r0.3.26.a (Multi-threading; Max num-threads is 20)

    Use OpenMP in the multithreading. Because of ignoring OPENBLAS_NUM_THREADS and GOTO_NUM_THREADS flags,
    you should use OMP_NUM_THREADS environment variable to control the number of threads.


At the end of the snowy build (s###) we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

     OS               ... Linux
     Architecture     ... x86_64
     BINARY           ... 64bit
     C compiler       ... GCC  (cmd & version : gcc (GCC) 12.3.0)
     Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 12.3.0)
     Library Name     ... libopenblas_sandybridgep-r0.3.26.a (Multi-threading; Max num-threads is 16)

At the end of the miarka build (m#) for 24 threads we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

     OS               ... Linux
     Architecture     ... x86_64
     BINARY           ... 64bit
     C compiler       ... GCC  (cmd & version : gcc (GCC) 12.3.0)
     Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 12.3.0)
     Library Name     ... libopenblas_skylakexp-r0.3.26.a (Multi-threading; Max num-threads is 24)

At the end of the miarka build (m#) for 48 (hyper)threads we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

     OS               ... Linux
     Architecture     ... x86_64
     BINARY           ... 64bit
     C compiler       ... GCC  (cmd & version : gcc (GCC) 12.3.0)
     Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 12.3.0)
     Library Name     ... libopenblas_skylakexp-r0.3.26.a (Multi-threading; Max num-threads is 48)

We will install the hyperthreaded miarka library.

At the end of the bianca build (sens2017625-b9) for 16 threads we see

    OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

     OS               ... Linux
     Architecture     ... x86_64
     BINARY           ... 64bit
     C compiler       ... GCC  (cmd & version : gcc (GCC) 12.3.0)
     Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 12.3.0)
     Library Name     ... libopenblas_haswellp-r0.3.26.a (Multi-threading; Max num-threads is 16)

