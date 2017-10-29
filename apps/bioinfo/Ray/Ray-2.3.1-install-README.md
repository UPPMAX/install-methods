Ray/2.3.1 and Ray/2.3.1-mpiio
=====


MPI-based WGS assembler

<http://denovoassembler.sourceforge.net>


These builds of Ray were originally built with gcc/4.8 and openmpi/1.7.0.

There seems to be a problem when compiling with MPI_IO=y... but I do not know enough
about MPI do know what it might be.  If I run an MPI_IO=y version with >2 processors,
it crashes.  So I am building both MPI_IO=n (default) and MPI_IO=y versions, and these
go into $VERSION and ${VERSION}-mpiio directories..
Also enable bzip2 and gzip compression and large kmers (up to 96).

LOG
---

    TOOL=/sw/apps/bioinfo/Ray
    VERSION=2.3.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOL/$VERSION/src
    mkdir -p $TOOL/$VERSION/$CLUSTER
    PFX=$TOOL/$VERSION/$CLUSTER
    PFX_MPIIO=$TOOL/${VERSION}-mpiio/$CLUSTER
    cd $TOOL/$VERSION/src
    rm -rf Ray-$VERSION
    [[ -f Ray-$VERSION.tar.bz2 ]] || wget https://github.com/sebhtml/Ray-Releases/raw/master/Ray-${VERSION}.tar.bz2
    tar xjvf Ray-$VERSION.tar.bz2 
    cd Ray-$VERSION

    module load gcc/6.3.0
    module load openmpi/2.1.0

    make clean
    make -j 8 PREFIX=$PFX MPI_IO=n MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install
    make clean
    make -j 8 PREFIX=$PFX_MPIIO MPI_IO=y MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install
    cd ..
    rm -rf Ray-$VERSION


And redo the process on other clusters.

