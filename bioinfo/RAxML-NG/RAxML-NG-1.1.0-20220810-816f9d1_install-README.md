RAxML-NG/1.1.0-20220810-816f9d1
===============================

<https://github.com/amkozlov/raxml-ng>

Used under license:
GNU AGPL 3.0


Structure creating script (makeroom_RAxML-NG_1.1.0-20220810-816f9d1.sh) moved to /sw/bioinfo/RAxML-NG/makeroom_1.1.0-20220810-816f9d1.sh

Install latest commit from master.

LOG
---

Since we build from master, we have to build from source.

Build on rackham for rackham/miarka/bianca, which all have AVX2, and on snowy for snowy, which has AVX but not AVX2.


On rackham:

    makeroom.sh -f -t RAxML-NG -v 1.1.0020220810-816f9d1 -d "a phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion" -w https://github.com/amkozlov/raxml-ng -l "GNU AGPL 3.0"
    ./makeroom_RAxML-NG_1.1.0-20220810-816f9d1.sh
    source /sw/bioinfo/RAxML-NG/SOURCEME_RAxML-NG_1.1.0-20220810-816f9d1

    cd $VERSIONDIR

    rm -f snowy 
    mkdir snowy

    cd $SRCDIR 

    module load git/2.34.1
    git clone --recursive https://github.com/amkozlov/raxml-ng

    cd raxml-ng

    module load cmake/3.22.2
    module load gcc/10.3.0
    module load GMP/6.2.1

### build for rackham

    mkdir build-rackham
    cd build-rackham

    vi ../libs/terraphast/cmake/FindGMP.cmake

I finally got this to work by forcing terraphast's FindGMP.cmake to use a specific local libgmp.so library. Prior to this, the cmake process was producing errors about incorrect number of arguments to cmake's `set_target_properties`; this is because the `find_library(GMP_LIBRARIES NAMES gmp libgmp)` produces the string `gmpxx;gmp` rather than the name of a library. I learned this by adding

    message("GMP_INCLUDE_DIR = ${GMP_INCLUDE_DIR}")
    message("GMP_LIBRARIES = ${GMP_LIBRARIES}")
    message("GMPXX_LIBRARIES = ${GMPXX_LIBRARIES}")

after the intial `find_path() find_library() find_library()` section. I could not figure how to make this work, so I brute-forced it by adding

    set(GMP_LIBRARIES "/sw/libs/GMP/6.2.1/rackham/lib/libgmp.so")

following the `find...()` section.

Once this is edited, run cmake, make the tool and install into the rackham prefix.

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DTERRAPHAST_USE_THREADS:BOOL=TRUE -DTERRAPHAST_ARCH_NATIVE:BOOL=ON -DTERRAPHAST_USE_GMP:BOOL=ON -DUSE_GMP:BOOL=ON -DENABLE_SSE=true -DENABLE_AVX=true -DENABLE_AVX2=true -DGMP_INCLUDE_DIR:PATH=$GMP_ROOT/include -DGMP_LIBRARIES:FILEPATH=$GMP_ROOT/lib/libgmp.so -DGMPXX_LIBRARIES:FILEPATH=$GMP_ROOT/lib/libgmpxx.so

    make
    make install


### build for snowy, on snowy

    source /sw/bioinfo/RAxML-NG/SOURCEME_RAxML-NG_1.1.0-20220810-816f9d1
    cd $SRCDIR 
    cd raxml-ng

    module load cmake/3.22.2
    module load gcc/10.3.0
    module load GMP/6.2.1

    mkdir build-snowy
    cd build-snowy

    vi ../libs/terraphast/cmake/FindGMP.cmake

Change library path to snowy. This may not actually change the library included, but it may in the future.

    set(GMP_LIBRARIES "/sw/libs/GMP/6.2.1/snowy/lib/libgmp.so")

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DTERRAPHAST_USE_THREADS:BOOL=TRUE -DTERRAPHAST_ARCH_NATIVE:BOOL=ON -DTERRAPHAST_USE_GMP:BOOL=ON -DUSE_GMP:BOOL=ON -DENABLE_SSE=true -DENABLE_AVX=true -DENABLE_AVX2=true -DGMP_INCLUDE_DIR:PATH=$GMP_ROOT/include -DGMP_LIBRARIES:FILEPATH=$GMP_ROOT/lib/libgmp.so -DGMPXX_LIBRARIES:FILEPATH=$GMP_ROOT/lib/libgmpxx.so

    make
    make install

