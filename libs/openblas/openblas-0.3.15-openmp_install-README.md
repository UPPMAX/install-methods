openblas/0.3.15-openmp
========================

<https://github.com/xianyi/OpenBLAS>

Used under license:
BSD 3-clause

Structure creating script (makeroom_openblas_0.3.15-openmp.sh) moved to /sw/libs/openblas/makeroom_0.3.15-openmp.sh

We need to build separate rackham and snowy/irma/bianca libraries.

LOG
---

    TOOL=openblas
    TOOLVERSION=0.3.15
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
    module load gcc/9.3.0
    make clean
    [[ $CLUSTER = rackham ]] && NUM_CORES=20 || NUM_CORES=16
    make USE_OPENMP=1 NUM_CORES=$NUM_CORES
    make USE_OPENMP=1 NUM_CORES=$NUM_CORES PREFIX=$PREFIX install
    cd ..
    rm -rf OpenBLAS-$TOOLVERSION

At the end of the snowy build, we see

     OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

      OS               ... Linux
      Architecture     ... x86_64
      BINARY           ... 64bit
      C compiler       ... GCC  (cmd & version : gcc (GCC) 9.3.0)
      Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 9.3.0)
      Library Name     ... libopenblas_sandybridgep-r0.3.15.a (Multi-threading; Max num-threads is 16)

     Use OpenMP in the multithreading. Because of ignoring OPENBLAS_NUM_THREADS and GOTO_NUM_THREADS flags,
     you should use OMP_NUM_THREADS environment variable to control the number of threads.


At the end of the rackham build, we see

     OpenBLAS build complete. (BLAS CBLAS LAPACK LAPACKE)

      OS               ... Linux
      Architecture     ... x86_64
      BINARY           ... 64bit
      C compiler       ... GCC  (cmd & version : gcc (GCC) 9.3.0)
      Fortran compiler ... GFORTRAN  (cmd & version : GNU Fortran (GCC) 9.3.0)
      Library Name     ... libopenblas_haswellp-r0.3.15.a (Multi-threading; Max num-threads is 20)

     Use OpenMP in the multithreading. Because of ignoring OPENBLAS_NUM_THREADS and GOTO_NUM_THREADS flags,
     you should use OMP_NUM_THREADS environment variable to control the number of threads.


