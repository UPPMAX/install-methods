hmmer/3.0-intel
===============


Log in to kalkyl4. biologin does not have support for infiniband.

Downloaded the source code from: http://hmmer.janelia.org/software to my glob folder

Unpacked the source code:

    gunzip hmmer-3.0.tar.gz 
    tar xvf hmmer-3.0.tar

Created the folder:

    mkdir //////sw/apps/bioinfo/hmmer/3.0_kalkyl_intel

Loaded the necessary compilers and programs:

    module load intel/11.1
    module load openmpi_intel/1.4

    cd ~/glob/hmmer-3.0
    ./configure --prefix //////sw/apps/bioinfo/hmmer/3.0_kalkyl_intel CC=icc --enable-mpi
    make
    make check
    make install
