MPFR/4.2.1
==========

<https://www.mpfr.org/>

Used under license:
LGPL v3+

Structure creating script (makeroom_MPFR_4.2.1.sh) moved to /sw/libs/MPFR/makeroom_4.2.1.sh

LOG
---

    TOOL=MPFR
    VERSION=4.2.1
    makeroom.sh -f -t $TOOL -v $VERSION -c libs -w https://www.mpfr.org/ -l "LGPL v3+" -d "C library for multiple-precision floating-point computations with correct rounding"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/libs/$TOOL/SOURCEME_${TOOL}_${VERSION} 
    cd $VERSIONDIR
    rm -f snowy
    mkdir snowy
    cd $SRCDIR
    [[ -f mpfr-${VERSION}.tar.gz ]] || wget https://www.mpfr.org/mpfr-current/mpfr-${VERSION}.tar.gz
    [[ -d mpfr-${VERSION} ]] || rm -rf mpfr-${VERSION}/
    tar xf mpfr-${VERSION}.tar.gz 
    cd mpfr-${VERSION}/
    ml gcc/12.3.0
    ml GMP/6.3.0
    ./configure --with-gmp=$GMP_ROOT --prefix=$PREFIX
    make -j 10
    make check
    make install

Build for snowy on snowy-lr1.

    cd /sw/libs/MPFR
    source /sw/libs/MPFR/SOURCEME_MPFR_4.2.1
    cd $SRCDIR
    [[ -d mpfr-${VERSION}/ ]] && rm -rf mpfr-${VERSION}/
    tar xf mpfr-${VERSION}.tar.gz 
    cd mpfr-${VERSION}/
    ml gcc/12.3.0
    ml GMP/6.3.0
    ./configure --with-gmp=$GMP_ROOT --prefix=$PREFIX
    make -j 10
    make check
    make install
    cd ..
    rm -rf mpfr-${VERSION}/

