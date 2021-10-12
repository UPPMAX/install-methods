ARPACK-NG/3.8.0
========================

<https://github.com/opencollab/arpack-ng>

Used under license:
BSD Software License
<https://github.com/opencollab/arpack-ng/blob/master/COPYING>

Structure creating script (makeroom_ARPACK-NG_3.8.0.sh) moved to /sw/libs/ARPACK-NG/makeroom_3.8.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "ARPACK-NG" -v "3.8.0" -c "libs" -w "https://github.com/opencollab/arpack-ng" -d "ARPACK-NG is a collection of Fortran77 subroutines designed to solve large scale eigenvalue problems." -l "BSD Software License" -L "https://github.com/opencollab/arpack-ng/blob/master/COPYING"
    ./makeroom_ARPACK-NG_3.8.0.sh
    source /sw/libs/ARPACK-NG/SOURCEME_ARPACK-NG_3.8.0
    cd $SRCDIR

    module load cmake/3.17.3
    module load gcc/9.3.0
    module load openblas/0.3.15

    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/opencollab/arpack-ng/archive/refs/tags/3.8.0.tar.gz
    [[ -d arpack-ng-${VERSION} ]] && rm -rf arpack-ng-${VERSION}
    tar xf ${VERSION}.tar.gz 
    cd arpack-ng-3.8.0/
    mkdir build
    cd build
    cmake -DEXAMPLES=ON  -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=$PREFIX  ..
    make
    make test
    make install

Double-check the RPATH info for the library.

    module load patchelf
    patchelf --print-rpath $PREFIX/lib64/libsuperlu.so

Since this is built against openblas, which has separate rackham and
snowy/irma/bianca versions, build separately for snowy/irma/bianca.

