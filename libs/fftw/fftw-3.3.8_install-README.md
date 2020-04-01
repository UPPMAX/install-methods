fftw/3.3.8
========================

<http://www.fftw.org>

Used under license:
GPL

Structure creating script (makeroom_fftw_3.3.8.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/fftw/makeroom_3.3.8.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -t "fftw" -v "3.3.8" -w "http://www.fftw.org" -c "libs" -l "GPL" -d "C subroutine library for computing the discrete Fourier transform \(DFT\) in one or more dimensions\, of arbitrary input size\, and of both real and complex data"


Need to build different versions for rackham and snowy/irma/bianca


LOG
---

    TOOL=fftw
    VERSION=3.3.8
    makeroom.sh -f" -t "${TOOL}" -v "$(VERSION}" -w "http://www.fftw.org" -c "libs" -l "GPL" -d "C subroutine library for computing the discrete Fourier transform \(DFT\) in one or more dimensions\, of arbitrary input size\, and of both real and complex data"
    ./makeroom_${TOOL}_$(VERSION}.sh


    cd /sw/libs/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $PREFIX/..

    if [[ $CLUSTER == snowy ]] ; then
        rm -rf snowy irma bianca
        mkdir snowy
        ln -s snowy irma
        ln -s snowy bianca
    fi

    cd src
    [[ -f ${TOOL}-${VERSION}.tar.gz ]] || wget http://www.fftw.org/${TOOL}-${VERSION}.tar.gz
    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
    tar xzf ${TOOL}-${VERSION}.tar.gz
    cd ${TOOL}-${VERSION}
    ./configure --prefix=$PREFIX --enable-shared=yes
    make
    make install

    echo "build on both snowy and rackham!!!!"

The mf file should contain lots of stuff.
