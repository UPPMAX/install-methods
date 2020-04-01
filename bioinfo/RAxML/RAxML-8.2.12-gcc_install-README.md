RAxML/8.2.12-gcc
================

<https://github.com/stamatak/standard-RAxML>

Used under license:
GPL v3

Structure creating script (makeroom_RAxML_8.2.12-gcc.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/RAxML/makeroom_8.2.12-gcc.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -t "RAxML" -v "8.2.12-gcc" -s "phylogeny" -w "https://github.com/stamatak/standard-RAxML" -d "A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies" -m "raxml" -l "GPL v3"


LOG
---

We build and locate both non-MPI and MPI versions alongside each other, and
provide different mf files, with the one for MPI loading openmpi.

    TOOL=RAxML
    TOOLVERSION=8.2.12
    VERSION=${TOOLVERSION}-gcc
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}
    mkdir -p ${VERSION}
    ln -s ${VERSION} ${VERSION}-mpi
    cd ${VERSION}
    cd src
    [[ -f v${TOOLVERSION}.tar.gz ]] || wget https://github.com/stamatak/standard-RAxML/archive/v${TOOLVERSION}.tar.gz
    [[ -f standard-RAxML-${TOOLVERSION} ]] || tar xzf v${TOOLVERSION}.tar.gz 
    cd standard-RAxML-${TOOLVERSION}/
    rm -f *.o raxmlHPC-*

Use the individual makefiles to build different versions, and load openmpi
prior to building with those makefiles.

    module load gcc/8.4.0

    make -f Makefile.AVX.gcc
    rm -f *.o
    make -f Makefile.AVX.PTHREADS.gcc
    rm -f *.o

    module load openmpi/3.1.5

    make -f Makefile.AVX.MPI.gcc
    rm -f *.o
    make -f Makefile.AVX.HYBRID.gcc
    cp raxmlHPC-* $PREFIX/

Now copy the `usefulScripts/` directory and make them executable.

    cp -av usefulScripts $PREFIX/
    cd $PREFIX/usefulScripts/
    chmod +x *

