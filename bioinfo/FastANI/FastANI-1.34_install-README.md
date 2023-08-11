FastANI/1.34
============

<https://github.com/ParBLiSS/FastANI>

Used under license:
Apache-2.0


Structure creating script (makeroom_FastANI_1.34.sh) moved to /sw/bioinfo/FastANI/makeroom_1.34.sh

LOG
---

To begin with, I submitted a pull request to correct a missing header file in the test system.
Also, must clone the repository, since it includes submodules. The prebuilt Linux binary does not
work on CentOS 7. Use GSL instead of Boost.

    makeroom.sh -f -t FastANI -v 1.34 -l Apache-2.0 -d "Fast Whole-Genome Similarity (ANI) Estimation" -w https://github.com/ParBLiSS/FastANI
    ./makeroom_FastANI_1.34.sh 
    source /sw/bioinfo/FastANI/SOURCEME_FastANI_1.34 && cd $SRCDIR

    module load git/2.34.1
    module load git-lfs/2.9.1
    module load gcc/10.3.0
    module load cmake/3.26.3
    module load zlib/1.2.12
    module load gsl/2.7

Cloning my repository instead of the original since it includes the fix.
DO NOT DO THIS FOR LATER VERSIONS. Make sure my pull request has been
incorporated into later versions, I will try to remember to update this
when I receive notification about it.

    git clone --recursive git@github.com:douglasgscofield/FastANI
    cd FastANI/
    vi tests/fastani_tests.cpp 

Add `#include <algorithm>` to the list of loaded header files.

Build, test, install.

    mkdir build_gsl
    cd build_gsl
    cmake .. -DCMAKE_BUILD_TYPE=Release --install-prefix $PREFIX -DGSL_ROOT_DIR=$GSL_ROOT
    make 
    make test
    make install
