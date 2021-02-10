MPFR/4.1.0
========================

<https://www.mpfr.org/>

Used under license:
LGPL v3+

Structure creating script (makeroom_MPFR_4.1.0.sh) moved to /sw/libs/MPFR/makeroom_4.1.0.sh

LOG
---

    TOOL=MPFR
    VERSION=4.1.0
    cd /sw/libs
    makeroom.sh -f -t $TOOL -v $VERSION -c libs -w https://www.mpfr.org/ -l "LGPL v3+" -d "C library for multiple-precision floating-point computations with correct rounding"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    rm -f snowy irma bianca
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca
    cd src/
    wget https://www.mpfr.org/mpfr-current/mpfr-${VERSION}.tar.gz
    tar xzf mpfr-${VERSION}.tar.gz 
    ml gcc/9.1.0
    ml GMP/6.2.1
    cd mpfr-${VERSION}/
    ./configure --with-gmp=$GMP_ROOT --prefix=$PREFIX
    make -j 10
    make check
    make install

Now build for snowy or rackham, whichever wasn't built.
