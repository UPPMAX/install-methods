cmake/4.1.1
============

<https://cmake.org/>

Used under license:
BSD 3-clause

Structure creating script (makeroom_cmake_4.1.1.sh) moved to /sw/build/cmake/makeroom_4.1.1.sh

LOG
---

Required for c++20 support, so build with our latest installed gcc, gcc/13.1.0.


    makeroom.sh "-f" "-t" "cmake" "-v" "4.1.1" "-c" "build" "-w" "https://cmake.org/" "-d" "open-source, cross-platform family of tools designed to build, test and package software" "-l" "BSD 3-clause" -L "https://gitlab.kitware.com/cmake/cmake/raw/master/Copyright.txt"
    ./makeroom_cmake_4.1.1.sh
    makeroom.sh -f -t "cmake" -v "4.1.1" -c "build" -w "https://cmake.org/" -d "open-source, cross-platform family of tools designed to build, test and package software" -l "BSD 3-clause"
    ./makeroom_cmake_4.1.1.sh 
    source /sw/build/cmake/SOURCEME_cmake_4.1.1
    cd $SRCDIR

    [[ -f cmake-$VERSION.tar.gz ]] || wget --timestamping https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz

    tar xzf cmake-$VERSION.tar.gz

    cd cmake-$VERSION

    module load gcc/13.3.0

    ./bootstrap --prefix=$PREFIX
    make -j 10
    make install

Now testing.

    ctest

Three tests failed.

    99% tests passed, 3 tests failed out of 763

    Label Time Summary:
    CMake      = 2863.64 sec
    CUDA       = 135.08 sec
    HIP        =  29.39 sec
    ISPC       =  84.96 sec
    Label1     =   0.07 sec
    Label2     =   0.07 sec
    Qt4        = 504.43 sec
    Qt5        = 653.89 sec
    command    =   3.55 sec
    policy     = 124.55 sec
    run        = 2860.09 sec

    Total Test time (real) = 5241.76 sec

    The following tests FAILED:
         81 - [=[Qt4Deploy]=] (Failed)
        543 - [=[RunCMake.CTestResourceAllocation]=] (Timeout)
        598 - [=[RunCMake.CPack_DEB.DEBUGINFO]=] (Failed)
    Errors while running CTest
