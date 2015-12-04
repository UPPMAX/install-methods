    mkdir -p /sw/libs/openblas/0.2.14a/src
    cd /sw/libs/openblas/0.2.14a/src
    wget https://github.com/xianyi/OpenBLAS/zipball/master
    mv master xianyi-OpenBLAS-v0.2.14-0-gd0c51c4.zip
    unzip xianyi-OpenBLAS-v0.2.14-0-gd0c51c4.zip 
    cd xianyi-OpenBLAS-d0c51c4/
    module load gcc/4.9.2
    make
    mkdir -p /sw/libs/openblas/0.2.14a/milou
    make PREFIX=/sw/libs/openblas/0.2.14a/milou install
