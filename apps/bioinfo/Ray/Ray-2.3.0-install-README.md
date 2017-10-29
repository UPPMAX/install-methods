# Ray-2.3.0-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Ray 2.3.0

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
/sw/apps/bioinfo/Ray/2.3.0/$Cluster to the user's PATH.

They may also want to examine the documentation etc. under /sw/apps/bioinfo/Ray/2.3.0/RayPlatform

LOG
---

    mkdir -p /sw/apps-bioinfo/Ray/2.3.0/src
    mkdir -p /sw/apps-bioinfo/Ray/2.3.0/milou
    mkdir -p /sw/apps-bioinfo/Ray/2.3.0/kalkyl
    cd /sw/apps-bioinfo/Ray/2.3.0/src
    wget http://sourceforge.net/projects/denovoassembler/files/Ray-2.3.0.tar.bz2/download
    tar xjvf Ray-2.3.0.tar.bz2 
    cd Ray-2.3.0

Edit the `Makefile` so that the install copies `RayPlatform/README.md` instead
of `RayPlatform/README` which doesn't exist.  We also need to load MPI.  So on
each of kalkyl and milou:

    module load bioinfo-tools
    module load gcc/4.8
    module load openmpi/1.7.0

I enabled bzip2 and gzip compression and large kmers (up to 96).  I considered 
and rejected enabling native instructions and structure-packing.  Specifying 
the FORCE_PACKING=y option resulted in this message during compilation:

    In file included from code/VerticesExtractor/Vertex.h:26,
                 from code/VerticesExtractor/GridTable.h:25,
                 from code/VerticesExtractor/GridTableIterator.h:25,
                 from code/VerticesExtractor/GridTableIterator.cpp:22:
    ./code/SeedExtender/Direction.h:40: warning: ignoring packed attribute because of unpacked non-POD field ‘PathHandle Direction::m_wave’

Continuing with the build in /sw/apps-bioinfo/Ray/2.3.0/src, on kalkyl:

    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/2.3.0/kalkyl MPI_IO=y MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install

and in the same directory on milou:

    make clean
    make -j 4 PREFIX=/sw/apps/bioinfo/Ray/2.3.0/milou MPI_IO=y MPICXX=mpiCC MAXKMERLENGTH=96 HAVE_LIBZ=y HAVE_LIBBZ2=y DEBUG=n ASSERT=n
    make install

