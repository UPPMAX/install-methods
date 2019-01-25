raxml-8.2.10-gcc-install-README.md
==================================

<https://github.com/stamatak/standard-RAxML>

LOG
---

We build and locate both non-MPI and MPI versions alongside each other, and
provide different mf files, with the one for MPI loading openmpi.

    VERSION=8.2.10
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd RAxML
    mkdir ${VERSION}-gcc
    ln -s ${VERSION}-gcc ${VERSION}-gcc-mpi
    cd ${VERSION}-gcc
    mkdir $CLUSTER
    mkdir src
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/stamatak/standard-RAxML/archive/v${VERSION}.tar.gz
    [[ -f standard-RAxML-${VERSION} ]] || tar xzf v${VERSION}.tar.gz 
    cd standard-RAxML-${VERSION}/
    rm -f *.o raxmlHPC-*

Use the individual makefiles to build different versions, and load openmpi
prior to building with those makefiles.

    module load gcc/6.3.0

    make -f Makefile.AVX.gcc
    rm -f *.o
    make -f Makefile.AVX.PTHREADS.gcc
    rm -f *.o

    module load openmpi/2.1.0

    make -f Makefile.AVX.MPI.gcc
    rm -f *.o
    make -f Makefile.AVX.HYBRID.gcc
    cp raxmlHPC-* ../../$CLUSTER/

Now copy the `usefulScripts/` directory and make them executable.

    cp -av usefulScripts ../../$CLUSTER/
    cd ../../$CLUSTER/usefulScripts/
    chmod +x *

