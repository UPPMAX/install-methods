abyss/1.5.2
===========

LOG
---

This will work on milou or tintin

    CLUSTER=milou

    VERSION=1.5.2

    module load gcc/4.9.2
    module load openmpi/1.8.4


to build sparsehash

    cd /sw/apps/bioinfo/abyss/src/sparsehash-2.0.2
    ./configure --prefix=/sw/apps/bioinfo/abyss/$VERSION/sparsehash/$CLUSTER
    make && make install


to build abyss for max kmer 96

    cd /sw/apps/bioinfo/abyss/src/abyss-$VERSION
    ./configure CPPFLAGS=-I/sw/apps/bioinfo/abyss/$VERSION/sparsehash/$CLUSTER/include --with-mpi=$MPI_ROOT --prefix=/sw/apps/bioinfo/abyss/$VERSION/$CLUSTER --enable-maxk=96
    make AM_CXXFLAGS=-Wall
    make install

to build abyss for max kmer 128

    make distclean
    ./configure CPPFLAGS=-I/sw/apps/bioinfo/abyss/$VERSION/sparsehash/$CLUSTER/include --with-mpi=$MPI_ROOT --prefix=/sw/apps/bioinfo/abyss/${VERSION}-k128/$CLUSTER --enable-maxk=128
    make AM_CXXFLAGS=-Wall
    make install

