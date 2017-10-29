# Ray-2.3.1-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Ray 2.3.1

DESCRIPTION
-----------

MPI-based WGS assembler

WEBSITE
-------

    http://denovoassembler.sourceforge.net

MODULE REQUIREMENTS
-------------------

These builds of Ray require the gcc/4.8 and openmpi/1.7.0
modules to be loaded.  Then simply add
/sw/apps/bioinfo/Ray/2.3.0/$Cluster to the user PATH.

They may also want to examine the documentation etc. under /sw/apps/bioinfo/Ray/2.3.0/RayPlatform

LOG
---

    TOOLDIR=/sw/apps/bioinfo/Ray
    VERSION=2.3.1
    CLUSTER=milou
    mkdir -p $TOOLDIR/$VERSION/src
    mkdir -p $TOOLDIR/$VERSION/$CLUSTER
    cd $TOOLDIR/$VERSION/src
    wget https://github.com/sebhtml/Ray-Releases/raw/master/Ray-${VERSION}.tar.bz2
    tar xjvf Ray-$VERSION.tar.bz2 
    cd Ray-$VERSION

    module load bioinfo-tools
    module load gcc/4.8
    module load openmpi/1.7.0

There seems to be a problem when compiling with MPI_IO=y... but I do not know enough
about MPI do know what it might be.  If I run an MPI_IO=y version with >2 processors,
it crashes.  So I am building both MPI_IO=n (default) and MPI_IO=y versions.

I also enable bzip2 and gzip compression and large kmers (up to 96).

Continuing with the build in /sw/apps-bioinfo/Ray/$VERSION/src, on milou:

    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/$VERSION/milou MPI_IO=n MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install
    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/${VERSION}-mpiio/milou MPI_IO=y MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install

and in the same directory on tintin:

    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/$VERSION/tintin MPI_IO=n MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install
    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/${VERSION}-mpiio/tintin MPI_IO=y MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install

