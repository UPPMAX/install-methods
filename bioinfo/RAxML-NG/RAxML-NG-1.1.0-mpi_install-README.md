RAxML-NG/1.1.0-mpi
==================

<https://github.com/amkozlov/raxml-ng>

Used under license:
GNU AGPL 3.0


Structure creating script (makeroom_RAxML-NG_1.1.0-mpi.sh) moved to /sw/bioinfo/RAxML-NG/makeroom_1.1.0-mpi.sh

LOG
---

    makeroom.sh -f -t RAxML-NG -v 1.1.0-mpi -d "a phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion, with MPI support" -w https://github.com/amkozlov/raxml-ng -l "GNU AGPL 3.0"
    ./makeroom_RAxML-NG_1.1.0-mpi.sh 
    source /sw/bioinfo/RAxML-NG/SOURCEME_RAxML-NG_1.1.0-mpi && cd $TOOLDIR
    cd $SRCDIR
    wget https://github.com/amkozlov/raxml-ng/releases/download/1.1.0/raxml-ng_v1.1.0_linux_x86_64_MPI.zip
    unzip raxml-ng_v1.1.0_linux_x86_64_MPI.zip 

This is a source directory, so load cmake, gcc, openmpi and patchelf (needed later).

    ml cmake/3.17.3 patchelf gcc/9.3.0 openmpi/3.1.5
    mkdir build
    cd build
    echo $PREFIX
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make && make install
    cd $PREFIX/bin
    patchelf --set-rpath $LD_LIBRARY_PATH raxml-ng-mpi 
    ml purge
    ldd raxml-ng-mpi 
    ./raxml-ng-mpi -h

Make sure the correct gcc and openmpi versions are loaded in the mf file.

