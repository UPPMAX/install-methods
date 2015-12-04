# jemalloc-3.6.0-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    jemalloc 3.6.0

DESCRIPTION
-----------

(from the website) jemalloc is a general purpose malloc(3) implementation that
emphasizes fragmentation avoidance and scalable concurrency support. jemalloc
first came into use as the FreeBSD libc allocator in 2005, and since then it
has found its way into numerous applications that rely on its predictable
behavior. In 2010 jemalloc development efforts broadened to include developer
support features such as heap profiling, Valgrind integration, and extensive
monitoring/tuning hooks. Modern jemalloc releases continue to be integrated
back into FreeBSD, and therefore versatility remains critical. Ongoing
development efforts trend toward making jemalloc among the best allocators for
a broad range of demanding applications, and eliminating/mitigating weaknesses
that have practical repercussions for real world applications.

WEBSITE
-------

    http://www.canonware.com/jemalloc/

MODULE REQUIREMENTS
-------------------

Built with

    gcc/4.8.3


LOG
---

    TOOL=/sw/apps/jemalloc
    VERSION=3.6.0
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p mf $VERSION
    cd $TOOLDIR
    mkdir -p src $CLUSTER 
    cd src
    wget http://www.canonware.com/download/jemalloc/jemalloc-${VERSION}.tar.bz2
    tar xjf jemalloc-${VERSION}.tar.bz2
    cd jemalloc-${VERSION}/

Now load pieces for the build and build it.  There are many options listed in
INSTALL but we are accepting the default configuration.  config.log contains
many details, including configuration programs that fail.  As far as I can
tell, this is all OK.


    module load build-tools
    module load gcc/4.8.3

    ./configure --prefix=$CLUSTERDIR
    make
    make install
    cd $TOOLDIR/src  # which is ..
    mv jemalloc-${VERSION} jemalloc-${VERSION}-milou

Following what I did for gsl (Gnu Scientific Library), we should probably set
both LD_LIBRARY_PATH and LD_RUN_PATH to point to $CLUSTERDIR/lib when loading
this module.  We should also arrange for include directories via CPATH.  So in
the mf file we need

    prepend-path LD_LIBRARY_PATH $modpath/lib
    prepend-path LD_RUN_PATH     $modpath/lib
    prepend-path CPATH           $modpath/include

Set up for other systems.

    cd $TOOLDIR
    ln -s ./milou nestor
    ln -s ./milou halvan

Repeat for tintin.

    TOOL=/sw/apps/jemalloc
    VERSION=3.6.0
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=tintin
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    cd $TOOLDIR
    mkdir -p $CLUSTER 
    cd src
    tar xjf jemalloc-${VERSION}.tar.bz2
    cd jemalloc-${VERSION}/
    module load build-tools
    module load gcc/4.8.3
    ./configure --prefix=$CLUSTERDIR
    make
    make install
    cd $TOOLDIR/src
    mv jemalloc-${VERSION} jemalloc-${VERSION}-tintin


