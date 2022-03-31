SuperLU/5.2.1
=============

<https://github.com/xiaoyeli/superlu>

Used under license:
Custom licence
<https://github.com/xiaoyeli/superlu/blob/master/License.txt>

Structure creating script (makeroom_SuperLU_5.2.1.sh) moved to /sw/libs/SuperLU/makeroom_5.2.1.sh

LOG
---

    makeroom.sh -f" -t "SuperLU" -v "5.2.1" -c "libs" -w "https://github.com/xiaoyeli/superlu" -d "SuperLU contains a set of subroutines to solve a sparse linear system A\*X=B." -l "Custom licence" -L "https://github.com/xiaoyeli/superlu/blob/master/License.txt"
    ./makeroom_SuperLU_5.2.1.sh
    source /sw/libs/SuperLU/SOURCEME_SuperLU_5.2.1 

    cd $SRCDIR
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/xiaoyeli/superlu/archive/refs/tags/v${VERSION}.tar.gz

    module load cmake/3.17.3
    module load gcc/9.3.0
    module load openblas/0.3.15

Shared libraries.

    cd $SRCDIR
    [[ -d superlu-${VERSION} ]] && rm -rf superlu-${VERSION}
    tar xf v${VERSION}.tar.gz 
    cd superlu-${VERSION}/
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DUSE_XSDK_DEFAULTS:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=ON ..
    make
    ctest
    make install

Static libraries

    cd $SRCDIR
    [[ -d superlu-${VERSION} ]] && rm -rf superlu-${VERSION}
    tar xf v${VERSION}.tar.gz 
    cd superlu-${VERSION}/
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DUSE_XSDK_DEFAULTS:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=OFF -DBLAS_openblas_LIBRARY:FILEPATH=$OPENBLAS_ROOT/lib/libopenblas.a ..
    make
    ctest
    make install

Since this is built against openblas, which has separate rackham and
snowy/irma/bianca versions, build separately for snowy/irma/bianca.

