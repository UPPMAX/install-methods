SuiteSparse/7.7.0
========================

<http://suitesparse.com>

Used under license:
Multiple
<https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt>

Structure creating script (makeroom_SuiteSparse_7.7.0.sh) moved to /sw/libs/SuiteSparse/makeroom_7.7.0.sh

LOG
---

    makeroom.sh "-f" "-t" "SuiteSparse" "-v" "7.7.0" "-c" "libs" "-l" "Multiple" "-L" "https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt" "-w" "http://suitesparse.com" "-d" "Suite of sparse matrix packages"
    ./makeroom_SuiteSparse_7.7.0.sh
    source /sw/libs/SuiteSparse/SOURCEME_SuiteSparse_7.7.0
    cd $SRCDIR
    wget https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v7.7.0.tar.gz
    tar xf v7.7.0.tar.gz
    cd SuiteSparse-7.7.0

Open the Makefile and add to the CMAKE_OPTIONS line the option -DCMAKE_INSTALL_PREFIX=$(PREFIX) and
change JOBS to be 20.

    vi Makefile

These lines should look like:

    export CMAKE_OPTIONS ?= -DCMAKE_INSTALL_PREFIX=$(PREFIX)

    ...

    export JOBS ?= 20


Load required modules, and build.

    ml cmake/3.26.3
    ml gcc/12.3.0
    ml binutils/2.41
    ml openblas/0.3.26
    ml GMP/6.3.0
    ml MPFR/4.2.1

    make
    make install

Now to update the RPATH information for the libraries. See what each requires, and update each in turn.

    ml patchelf/0.10

    cd $PREFIX

Programs.

    cd $PREFIX/bin/
    ldd suitesparse_mongoose 
    patchelf --set-rpath '$ORIGIN/../lib64:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' suitesparse_mongoose 

Libraries.

    cd $PREFIX/lib64/

    ls *.so

    ldd libumfpack.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64:/sw/libs/openblas/0.3.26/rackham/lib' libumfpack.so

    ldd libsuitesparse_mongoose.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libsuitesparse_mongoose.so

    ldd libsuitesparseconfig.so
    patchelf --set-rpath '/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libsuitesparseconfig.so

    ldd libspqr.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64:/sw/libs/openblas/0.3.26/rackham/lib' libspqr.so

    ldd libspex.so
    patchelf --set-rpath '$ORIGIN:/sw/libs/MPFR/4.2.1/rackham/lib:/sw/libs/GMP/6.3.0/rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libspex.so

    ldd libspexpython.so
    patchelf --set-rpath '$ORIGIN:/sw/libs/MPFR/4.2.1/rackham/lib:/sw/libs/GMP/6.3.0/rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libspexpython.so

    ldd librbio.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' librbio.so

    ldd libparu.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64:/sw/libs/openblas/0.3.26/rackham/lib' libparu.so

    ldd libldl.so

Nothing needed.

    ldd liblagraphx.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' liblagraphx.so

    ldd liblagraph.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' liblagraph.so

    ldd libklu.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libklu.so

    ldd libklu_cholmod.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64:/sw/libs/openblas/0.3.26/rackham/lib' libklu_cholmod.so

    ldd libgraphblas.so
    patchelf --set-rpath '/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libgraphblas.so

    ldd libcxsparse.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libcxsparse.so

    ldd libcolamd.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libcolamd.so

    ldd libcholmod.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64:/sw/libs/openblas/0.3.26/rackham/lib' libcholmod.so

    ldd libccolamd.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libccolamd.so

    ldd libcamd.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libcamd.so

    ldd libbtf.so

Nothing needed.

    ldd libamd.so
    patchelf --set-rpath '$ORIGIN:/sw/comp/gcc/12.3.0_rackham/lib:/sw/comp/gcc/12.3.0_rackham/lib64' libamd.so

Make sure everything is find.

    ml purge
    ldd *.so 2>&1 | grep found
    cd ../bin
    ldd suitesparse_mongoose 
    ./suitesparse_mongoose 


Add the modules we used to the mf, and add the pkgconfig directory.

    cd $TOOLDIR/mf
    vi 7.7.0

