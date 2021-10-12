SymEngine/0.7.0
===============

<https://github.com/symengine/symengine>

Used under license:
MIT


Structure creating script (makeroom_SymEngine_0.7.0.sh) moved to /sw/libs/SymEngine/makeroom_0.7.0.sh

LOG
---

    makeroom.sh -f -c "libs" -t "SymEngine" -v "0.7.0" -l "MIT" -w "https://github.com/symengine/symengine" -d "SymEngine is a standalone fast C++ symbolic manipulation library"
    ./makeroom_SymEngine_0.7.0.sh
    source /sw/libs/SymEngine/SOURCEME_SymEngine_0.7.0
    cd $SRCDIR

    module load git/2.28.0
    module load cmake/3.17.3
    module load gcc/9.3.0
    module load patchelf/0.10
    module load python/3.8.7
    module load GMP/6.2.1
    module load MPFR/4.1.0
    module load MPC/1.2.1

    # libprimesieve, for SymEngine

    git clone https://github.com/kimwalisch/primesieve
    cd primesieve/
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_TESTS:BOOL=ON ..
    make -j10 && make install && ctest
    patchelf --set-rpath /sw/comp/gcc/9.3.0_rackham/lib64 $PREFIX/lib64/libsymengine.so
    cd ../..

    # SymEngine itself, point to our GMP MPFR MPC libraries and primesieve

    wget https://github.com/symengine/symengine/releases/download/v0.7.0/symengine-0.7.0.tar.gz
    tar xf symengine-0.7.0.tar.gz 
    cd symengine-0.7.0/
    mkdir build
    cd build/
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_RPATH_USE_LINK_PATH:BOOL=ON -DWITH_OPENMP:BOOL=ON -DWITH_PTHREAD:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=ON -DGMP_INCLUDE_DIR=$GMP_ROOT/include -DGMP_LIBRARY=$GMP_ROOT/lib/libgmp.so -DWITH_MPC:BOOL=ON -DMPC_INCLUDE_DIR=$MPC_ROOT/include -DMPC_LIBRARY=$MPC_ROOT/lib/libmpc.so -DWITH_MPFR:BOOL=ON -DMPFR_INCLUDE_DIR=$MPFR_ROOT/include -DMPFR_LIBRARY=$MPFR_ROOT/lib/libmpfr.so -DWITH_PRIMESIEVE:BOOL=ON -DPRIMESIEVE_LIBRARY=$PREFIX/lib64/libprimesieve.so -DPRIMESIEVE_INCLUDE_DIR=$PREFIX/include ..
    make -j10 && make install && ctest
    ldd $PREFIX/lib64/libsymengine.so
    patchelf --set-rpath $PREFIX/lib64:$GMP_ROOT/lib:$MPC_ROOT/lib:$MPFR_ROOT/lib:/sw/comp/gcc/9.3.0_rackham/lib64 $PREFIX/lib64/libsymengine.so
    cd ../..

    # SymEngine.py python binding
    #
    # it's not clear to me whether $PREFIX/lib/python3.8/site-packages/symengine/lib/symengine_wrapper.cpython-38-x86_64-linux-gnu.so is another build of SymEngine, but it seems like it might be

    wget https://github.com/symengine/symengine.py/archive/refs/tags/v0.7.2.tar.gz
    mv v0.7.2.tar.gz symengine.py-v0.7.2.tar.gz
    tar xf symengine.py-v0.7.2.tar.gz 
    cd symengine.py-0.7.2/
    python setup.py install --prefix=$PREFIX build_ext --symengine-dir=$PREFIX 
    patchelf --set-rpath $PREFIX/lib64:$GMP_ROOT/lib:$MPC_ROOT/lib:$MPFR_ROOT/lib:/sw/comp/gcc/9.3.0_rackham/lib64 $PREFIX/lib/python3.8/site-packages/symengine/lib/symengine_wrapper.cpython-38-x86_64-linux-gnu.so

