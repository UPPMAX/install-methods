EPACTS 3.2.6
============

EPACTS - Efficient and Parallelizable Association Container Toolbox



    cd /sw/apps/bioinfo/
    mkdir EPACTS
    cd EPACTS/
    mkdir mf 3.2.6
    cd 3.2.6/
    mkdir milou src
    wget http://csg.sph.umich.edu/kang/epacts/download/EPACTS-3.2.6.tar.gz
    tar xvzf EPACTS-3.2.6.tar.gz 
    cd EPACTS-3.2.6/

    cat INSTALL 

It needs access to libR.so, this should be available when we load the R package,
double-check.

    cd ../..   # back up to where 3.2.6 and mf are
    module spider R
    module load R/3.1.0
    module list
    echo $LD_LIBRARY_PATH 
    ll /sw/apps/R/x86_64/3.1.0/lib64/R/lib

Yep, it is available!  Since there are different latest-R versions for milou
(3.1.0) and tintin (3.0.2), there need to be separate mf files for each.  Build
and install for milou:

    ./configure --prefix=/sw/apps/bioinfo/EPACTS/3.2.6/milou LDFLAGS=-L/sw/apps/R/x86_64/3.1.0/lib64/R/lib
    make
    make install

To test the installation, download data.

    cd ../../milou/bin
    export EPACTS_DIR=/sw/apps/bioinfo/EPACTS/3.2.6/milou
    ./epacts download

Check and change hardcoded /usr/bin/perl to /usr/bin/env perl in the hash-bang lines.

    vi epacts* wGetOptions.pm 

Set those up now, making sure to load the appropriate R version while loading the
module.  Add milou/bin or tintin/bin to the PATH, and also define EPACTS_DIR to
the cluster directory.

    cd mf
    cp ../../SCORE-Seq/mf/5.3 3.2.6
    vi 3.2.6_tintin
    cp 3.2.6_tintin 3.2.6_milou
    vi 3.2.6_milou

Now, on tintin:

    cd /sw/apps/bioinfo/EPACTS/3.2.6/
    mkdir tintin
    cd src/
    module load R/3.0.2
    module list
    echo $LD_LIBRARY_PATH 
    rm -rf EPACTS-3.2.6
    tar xvzf EPACTS-3.2.6.tar.gz 
    cd EPACTS-3.2.6/
    ./configure --prefix=/sw/apps/bioinfo/EPACTS/3.2.6/milou LDFLAGS=-L/sw/apps/R/x86_64/3.0.2/lib64/R/lib
    make
    make install

Modify the hash-bang lines

    cd ../../tintin/bin
    vi epacts* wGetOptions.pm 

To test the installation, download data.

    cd ../../tintin/bin
    export EPACTS_DIR=/sw/apps/bioinfo/EPACTS/3.2.6/tintin
    ./epacts download

