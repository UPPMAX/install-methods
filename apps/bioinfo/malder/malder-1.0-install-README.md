malder/1.0
==========

<https://github.com/joepickrell/malder>

LOG
---

    VERSION=1.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir malder
    cd malder
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -d malder ]] || git clone https://github.com/joepickrell/malder.git
    cd malder/MALDER/

Load library modules, and older GSL.  I tried compiling with the `ATLAS/3.10.0` module but it was hard to link.

    module load gcc/5.4.0
    module load blas/3.6.0
    module load gsl/1.16

Modify Makefile for proper library order, and drop unnecessary `-I` and `-L` options.

    diff Makefile.orig Makefile

    3,4c3,4
    < CXXFLAGS = -fopenmp -Wall -I/opt/local/include -Wno-write-strings $(addprefix -I, ${IDIRS})
    < L = -L/opt/local/lib -lfftw3 -llapack -lgsl
    ---
    > CXXFLAGS = -fopenmp -Wall -Wno-write-strings $(addprefix -I, ${IDIRS})
    > L = -lfftw3 -llapack -lgsl -lcblas -lblas

If you do a parallel make, then it won't complete `malder`, you must run `make` twice.

    make clean
    make
    cp malder $PFX/

