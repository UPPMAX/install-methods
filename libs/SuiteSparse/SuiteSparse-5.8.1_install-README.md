SuiteSparse/5.8.1
========================

<http://suitesparse.com>

Used under license:
Multiple
<https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt>

Structure creating script (makeroom_SuiteSparse_5.8.1.sh) moved to /sw/libs/SuiteSparse/makeroom_5.8.1.sh

LOG
---

    TOOL=SuiteSparse
    VERSION=5.8.1
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/libs/SuiteSparse/5.8.1/src
    /home/douglas/bin/makeroom.sh -f" -t "SuiteSparse" -v "5.8.1" -c "libs" -l "Multiple" -L "https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt" -w "http://suitesparse.com" -d "Suite of sparse matrix packages"
    ./makeroom_SuiteSparse_5.8.1.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    make

cd /sw/libs
mkdir -P SuiteSparse
TOOL=SuiteSparse; VERSION=5.8.1; makeroom.sh -f -t "$TOOL" -v "$VERSION" -c libs -l Multiple -L "https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt" -w http://suitesparse.com -d "Suite of sparse matrix packages"
./makeroom_SuiteSparse_5.8.1.sh 
cd SuiteSparse/
source SOURCEME_SuiteSparse_5.8.1 
cd 5.8.1/
cd $SRCDIR/
wget https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz
echo $PREFIX
ml cmake/3.17.3
tar xzf v5.8.1.tar.gz 
module load gcc/9.1.0
module load openmpi/3.1.3
ml git/2.28.0
ml zlib/1.2.11
cd SuiteSparse-5.8.1/
ml openblas/0.2.20
cd GraphBLAS/
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
make -j 20
make install

1049  cd ..
1050  ll
1051  cd ..
1052  ll
1053  make library
1054  whereis gmp
1055  whereis mpfr
1056  whereis libmpfr
1057  module load MPFR/4.1.0
1058  ml
1059  make library
1060  cd ..
1061  rm -rf SuiteSparse-5.8.1/
1062  ll
1063  tar xzf v5.8.1.tar.gz 
1064  ll
1065  cd SuiteSparse-5.8.1/
1066  ll
1067  ml
1068  make -j20
1069  make clean
1070  ll ../../rackham/*
1071  rm -rf ../../rackham/*
1072  ll ../../rackham/*
1073  ll ../../rackham/
1074  ll
1075  make -j 20 library
1076  echo $LD_RUN_PATH
1077  ml -GMP -MPFR
1078  echo $LD_RUN_PATH
1079  module load MPFR/4.1.0
1080  echo $LD_RUN_PATH
1081  make -j 20 library
1082  gcc -L$MPFR_ROOT/lib -L$GMP_ROOT/lib -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr
1083  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 
1084  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr
1085  cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
1086  ll
1087  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 
1088  cd ../..
1089  make -j 20 library
1090  make install INSTALL=$PREFIX
1091  cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
1092  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 

    make install INSTALL=$PREFIX
    cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
    vi Makefile 
    make install INSTALL=$PREFIX
    cd SLIP_LU/Lib
    vi Makefile 
    echo 'add -L$(GMP_ROOT)/lib -L$(MPFR_ROOT)/lib to the end of line 104'
