bcl2fastq/2.16.0
================

Note Illumina's version is 2.16.0.10, but we are just calling this 2.16.0.

    TOOL=bcl2fastq
    VERSION=2.16.0
    TOOLDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOLDIR
    wget ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/Software/bcl2fastq/bcl2fastq2-v2.16.0.10.tar.gz
    tar xvzf bcl2fastq2-v2.16.0.10.tar.gz
    cd bcl2fastq
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    module load gcc/4.8.3
    module load build-tools
    module load cmake
    ../src/configure --prefix=$CLUSTERDIR
    make
    make install

The configure step will build a bunch of stuff even before the make, including
boost.  Even though we have boost installed, I would rather use the version
distributed with bcl2fastq.

For tintin, after the 'tar xvzf' step above has been completed:


    TOOL=bcl2fastq
    VERSION=2.16.0
    TOOLDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    CLUSTER=tintin
    CLUSTERDIR=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOLDIR
    cd bcl2fastq
    mkdir build_${CLUSTER}
    cd build_${CLUSTER}
    module load gcc/4.8.3
    module load build-tools
    # There is no cmake module for tintin, but the system version is enough.
    ../src/configure --prefix=$CLUSTERDIR
    make
    make install

Be sure to add the GCC 4.8.3 library directories to the mf file.
