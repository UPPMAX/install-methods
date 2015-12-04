    mkdir -p /sw/apps/bioinfo/eigensoft/6.0.1
    cd /sw/apps/bioinfo/eigensoft/6.0.1
    mkdir src
    cd src
    tar xzf EIG6.0.1.tar.gz
    cd EIG6.0.1
    cd bin
    vi *perl fixgreen ploteig  # change she-bang perl to #!/usr/bin/env perl
    cd ../src
    module load gcc/4.9.2
    module load gsl/1.16
    module load openblas/0.2.14a
    vi ../include/admutils.h  # to change IDSIZE to 128
    make
    make install
    cd ../..
    mv EIG6.0.1 ../milou  # or tintin, wherever it was compiled


