bcl2fastq/2.20.0
================

Note Illumina's full version is 2.20.0.422, only revealed once the downloaded
file is unzipped to reveal a gzipped tarball.

    TOOL=bcl2fastq
    VERSION=2.20.0
    ILLUMINAVERSION=${VERSION}.422
    CLUSTER=${CLUSTER:?CLUSTER must be set}

    TOOLDIR=/sw/apps/bioinfo/$TOOL
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    [[ -f bcl2fastq2-v${VERSION//./-}-tar.zip ]] || wget ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/software/bcl2fastq/bcl2fastq2-v${VERSION//./-}-tar.zip
    [[ -f bcl2fastq2-v${ILLUMINAVERSION}-Source.tar.gz ]] || unzip bcl2fastq2-v${VERSION//./-}-tar.zip
    [[ -d bcl2fastq ]] || tar xzf bcl2fastq2-v${ILLUMINAVERSION}-Source.tar.gz
    cd bcl2fastq
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    module load gcc/4.9.4
    ../src/configure --prefix=$PFX
    make
    make install

The configure step will build a bunch of stuff even before the make, including
boost (version 1.54.0).  It also builds several other libraries.  But, it won't
build with `gcc/5.4.0`.  I also found loading a `cmake` module is unnecessary,
it builds cmake 2.8.9 for itself.

Even though we have boost installed, I think it will build better accepting the
version distributed with bcl2fastq.

Repeat for rackham.

