DATES/4010
========================

<https://github.com/MoorjaniLab>

Used under license:



Structure creating script (makeroom_DATES_4010.sh) moved to /sw/bioinfo/DATES/makeroom_4010.sh

LOG
---
    TOOL=DATES
    VERSION=4010
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" $TOOL -v $VERSION "-w" "https://github.com/MoorjaniLab" "-s" "misc" "-d" "DATES \(Distribution of Ancestry Tracts of Evolutionary Signals\) is a method to estimate the time of admixture in ancient DNA samples described in Chintalapati et al. 2022 biorxiv" "-x" "INSTALL" "-f"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/bioinfo/DATES/SOURCEME_DATES_4010 && cd $SRCDIR

    if [[ $CLUSTER == snowy ]] ; then
        rm -rf snowy 
        mkdir snowy
    fi
    echo "build on both snowy and rackham!!!!"

    cd src/
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/priyamoorjani/${TOOL}/archive/v${VERSION}.tar.gz
    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
    tar xzf v${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}
    cd src
    module load gcc/6.3.0
    module load gsl/2.5
    module load openblas/0.2.20
    module load fftw/3.3.8

Now edit `Makefile` to find and load the right libraries and to build `grabpars`.  The corresponding lines should read:

    override LDLIBS +=  -lm -lgsl -lopenblas -lfftw3 $(NLIB)  # change -lblas to -lopenblas
    override CFLAGS += -c -g -p -Wimplicit  $(IDIR)           # no change here

    override CFLAGS += -I$(GSL_ROOT)/include -I$(OPENBLAS_ROOT)/include -I$(FFTW_ROOT)/include  # use env variables
    override LDFLAGS += -L$(GSL_ROOT)/lib -L$(OPENBLAS_ROOT)/lib/  -L$(FFTW_ROOT)/lib           # use env variables

The `all` and `clobber` targets should include `grabpars`:

    all:   dates_expfit dates  simpjack2 dowtjack grabpars

    clobber:  clean
            rm -f  dates_expfit dates grabpars simpjack2 dowtjack nicksrc/libnick.a bin/*


Clean, build, install.

    make clean && ( cd nicksrc ; make clean )
    make
    make install
    cp -av bin $PREFIX/

Double-check RPATH info

    module purge
    module load uppmax
    module load patchelf/0.10
    cd $PREFIX/bin
    patchelf --print-rpath dates
    ldd dates


