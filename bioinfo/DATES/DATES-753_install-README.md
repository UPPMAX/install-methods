DATES/753
=========

<https://github.com/priyamoorjani/DATES>

Used under license:


Structure creating script (makeroom_DATES_753.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/DATES/makeroom_753.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -t "DATES" -v "753" -w "https://github.com/priyamoorjani/DATES" -s "misc" -d "DATES \(Distribution of Ancestry Tracts of Evolutionary Signals\) is a method to estimate the time of admixture in ancient DNA samples described in Narasimhan\, Patterson et al. 2018"

LOG
---

Began by installing gsl/2.5, openblas/0.2.20, and fftw/3.3.8.

I should install separate rackham and snowy/irma/bianca versions.


    TOOL=DATES
    VERSION=753
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/priyamoorjani/DATES -s misc -d "DATES (Distribution of Ancestry Tracts of Evolutionary Signals) is a method to estimate the time of admixture in ancient DNA samples described in Narasimhan, Patterson et al. 2018"
    ./makeroom_${TOOL}_${VERSION}.sh 

    cd /sw/bioinfo/DATES
    source SOURCEME_DATES_753
    cd ${VERSION}/

    if [[ $CLUSTER == snowy ]] ; then
        rm -rf snowy irma bianca
        mkdir snowy
        ln -s snowy irma
        ln -s snowy bianca
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


