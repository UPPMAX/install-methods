regenie/3.4.1
========================

<https://rgcgithub.github.io/regenie>

Used under license:
MIT
<https://github.com/rgcgithub/regenie/blob/master/LICENSE>

Structure creating script (makeroom_regenie_3.4.1.sh) moved to /sw/bioinfo/regenie/makeroom_3.4.1.sh

LOG
---

    makeroom.sh "-t" "regenie" "-v" "3.4.1" "-c" "bioinfo" "-s" "misc" "-w" "https://rgcgithub.github.io/regenie" "-l" "MIT" "-L" "https://github.com/rgcgithub/regenie/blob/master/LICENSE" "-d" "regenie is a C++ program for whole genome regression modelling of large genome-wide association studies."
    ./makeroom_regenie_3.4.1.sh

    cd $SRCDIR
    wget http://code.enkre.net/bgen/tarball/release/bgen.tgz
    mkdir bgen &&  tar -xvf bgen.tgz -C bgen --strip-components=1

    cd bgen
    module load gcc/9.3.0 cmake
    export MKLROOT=/sw/comp/intel//compilers_and_libraries_2020.4.304/linux/mkl
    ./waf configure --prefix=$PREFIX
    ./waf install
 
     # to test
     ./build/test/unit/test_bgen

     cd $SRCDIR
     wget https://github.com/rgcgithub/regenie/archive/refs/tags/v3.4.1.tar.gz
     tar xvf v3.4.1.tar.gz 
     cd regenie-3.4.1
     mkdir -p build && cd build
     export CPLUS_INCLUDE_PATH=../../bgen/3rd_party/boost_1_55_0:../../bgen/genfile/include:../../bgen/3rd_party/zstd-1.1.0/lib:../../bgen/db/include:../../bgen/3rd_party/sqlite3
     BGEN_PATH=../../bgen/build cmake .. \
     -DZSTD_LIBRARY=../../bgen/build/3rd_party/zstd-1.1.0/libzstd.a \
     -DDB_LIBRARY=../../bgen/build/db/libdb.a \
     -DSQLITE3_LIBRARY=../../bgen/build/3rd_party/sqlite3/libsqlite3.a \
     -DBoost_LIBRARY=../../bgen/build/3rd_party/boost_1_55_0/libboost.a \
     -DBoost_INCLUDE_DIR=../../bgen/3rd_party/boost_1_55_0/boost \
     -DBGEN_LIBRARY=../../bgen/build/libbgen.a
     
     make -j 10

     module load patchelf
     patchelf --set-rpath /sw/comp/intel/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64:/sw/comp/gcc/9.3.0_rackham/lib64 regenie
     cp regenie $PREFIX/bin
    
     cd $TOOLDIR
     ./regenie-3.4.1_post-install.sh
