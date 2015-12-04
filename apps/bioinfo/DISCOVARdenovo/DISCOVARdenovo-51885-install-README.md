# DISCOVARdenovo-51885-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

DISCOVARdenovo 51185

DESCRIPTION
-----------

WGS assembler

WEBSITE
-------

    http://www.broadinstitute.org/software/discovar/blog/

Note that there are nightly-to-weekly releases of new versions, as DISCOVAR de
novo is still considered an experimental tool.  For the latest releases check:

    ftp://ftp.broadinstitute.org/pub/crd/DiscovarExp/latest_source_code/

MODULE REQUIREMENTS
-------------------

Discovar requires jemalloc, which I have made available as a module
(jemalloc/3.6.0).  It also needs gcc >= 4.7.

    module load build-tools
    module load gcc/4.8.3
    module load jemalloc/3.6.0

The configure process apparently does not check for jemalloc presence, it just
expects you to have it if you do not use the --with-jemalloc=<dir> option.
Looks like I should use the --with-jemalloc option.

Similarly, it wants samtools if use of BAM files is desired, but I cannot see
where it expects that as a config option.  OK now that I have read the manual,
DISCOVARdenovo requires that the 'samtools' command is available for it to
extract the reads from the BAM.  Since loading this in the mf file would
pollute user namespace if they do not want this functionality, I will not do
that but will issue a message when it is loaded.

LOG
---

    TOOLDIR=/sw/apps/bioinfo/DISCOVARdenovo
    VERSION=51885
    CLUSTER=milou
    mkdir -p $TOOLDIR/$VERSION/src
    mkdir -p $TOOLDIR/$VERSION/$CLUSTER
    cd $TOOLDIR/$VERSION/src
    wget ftp://ftp.broadinstitute.org/pub/crd/DiscovarExp/latest_source_code/discovarexp-${VERSION}.tar.gz
    tar xzf discovarexp-${VERSION}.tar.gz
    cd discovarexp-${VERSION}

    module load build-tools
    module load gcc/4.8.3
    module load jemalloc/3.6.0

    ./configure --with-jemalloc=/sw/apps/jemalloc/3.6.0/milou/lib --prefix=/sw/apps/bioinfo/DISCOVARdenovo/${VERSION}/${CLUSTER}

    make
    make install

    cd $TOOLDIR/$VERSION/src
    mv discovarexp-${VERSION} discovarexp-${VERSION}-${CLUSTER}

It takes a while to compile.

Now for tintin.


    TOOLDIR=/sw/apps/bioinfo/DISCOVARdenovo
    VERSION=51885
    CLUSTER=tintin
    mkdir -p $TOOLDIR/$VERSION/src
    mkdir -p $TOOLDIR/$VERSION/$CLUSTER
    cd $TOOLDIR/$VERSION/src
    wget ftp://ftp.broadinstitute.org/pub/crd/DiscovarExp/latest_source_code/discovarexp-${VERSION}.tar.gz
    tar xzf discovarexp-${VERSION}.tar.gz
    cd discovarexp-${VERSION}

    module load build-tools
    module load gcc/4.8.3
    module load jemalloc/3.6.0

    ./configure --with-jemalloc=/sw/apps/jemalloc/3.6.0/tintin/lib --prefix=/sw/apps/bioinfo/DISCOVARdenovo/${VERSION}/${CLUSTER}

    make
    make install

    cd $TOOLDIR/$VERSION/src
    mv discovarexp-${VERSION} discovarexp-${VERSION}-${CLUSTER}

