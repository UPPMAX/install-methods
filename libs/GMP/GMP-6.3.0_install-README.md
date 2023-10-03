GMP/6.3.0
=========

<https://gmplib.org/>

Used under license:
LGPL v3; GPL v2

Structure creating script (makeroom_GMP_6.3.0.sh) moved to /sw/libs/GMP/makeroom_6.3.0.sh

LOG
---

Build separate versions for rackham and snowy/irma/bianca.


    TOOL=GMP
    VERSION=6.3.0
    makeroom.sh -f -t $TOOL -v $VERSION -c libs -w https://gmplib.org/ -l "LGPL v3; GPL v2" -d "library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating-point numbers"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/libs/GMP/SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    rm -f $VERSIONDIR/snowy
    mkdir $VERSIONDIR/snowy
    [[ -f gmp-${VERSION}.tar.xz ]] || wget https://gmplib.org/download/gmp/gmp-${VERSION}.tar.xz
    [[ -d gmp-${VERSION}/ ]] && rm -rf gmp-${VERSION}/
    tar xf gmp-${VERSION}.tar.xz 
    cd gmp-${VERSION}/
    ml gcc/12.3.0
    ./configure --enable-cxx --prefix=$PREFIX
    make -j 10
    make check
    make install
    cd ..
    rm -rf gmp-${VERSION}/

Build for snowy on snowy-lr1.

    cd /sw/libs/GMP
    source /sw/libs/GMP/SOURCEME_GMP_6.3.0
    cd $SRCDIR
    [[ -d gmp-${VERSION}/ ]] && rm -rf gmp-${VERSION}/
    tar xf gmp-${VERSION}.tar.xz 
    cd gmp-${VERSION}/
    ml gcc/12.3.0
    ./configure --enable-cxx --prefix=$PREFIX
    make -j 10
    make check
    make install
    cd ..
    rm -rf gmp-${VERSION}/

