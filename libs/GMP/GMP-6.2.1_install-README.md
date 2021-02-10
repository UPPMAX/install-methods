GMP/6.2.1
========================

<https://gmplib.org/>

Used under license:
LGPL v3; GPL v2

Structure creating script (makeroom_GMP_6.2.1.sh) moved to /sw/libs/GMP/makeroom_6.2.1.sh

LOG
---

Build separate versions for rackham and snowy/irma/bianca.


    TOOL=GMP
    VERSION=6.2.1
    cd /sw/libs
    makeroom.sh -f -t $TOOL -v $VERSION -c libs -w https://gmplib.org/ -l "LGPL v3; GPL v2" -d "library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating-point numbers"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    rm -f snowy bianca irma
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca
    cd src/
    wget https://gmplib.org/download/gmp/gmp-${VERSION}.tar.xz
    tar xJf gmp-${VERSION}.tar.xz 
    cd gmp-${VERSION}/
    ./configure --enable-cxx --prefix=$PREFIX
    make -j 10
    make check
    make install

Now build for rackham or snowy, whichever wasn't included.
