abyss/2.0.2 and abyss/2.0.2-k128
================================

ABySS assembler with default max kmer of 64 and additional version with max kmer 128.

<http://www.bcgsc.ca/platform/bioinfo/software/abyss>

LOG
---

Default kmer size.

    VERSION=2.0.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/abyss
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/${VERSION}/abyss-${VERSION}.tar.gz
    tar xzf abyss-${VERSION}.tar.gz 
    cd abyss-${VERSION}/
    module load gcc/6.3.0
    module load openmpi/2.1.0
    module load boost/1.63.0_gcc6.3.0
    module load sparsehash/2.0.3
    module load sqlite/3.16.2
    ./configure --prefix=$PFX
    make -j 8
    make install

Max kmer 128 bp.

    MAXK=128
    REMOTEVERSION=2.0.2
    VERSION=${REMOTEVERSION}-k${MAXK}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/abyss
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/${REMOTEVERSION}/abyss-${REMOTEVERSION}.tar.gz
    tar xzf abyss-${REMOTEVERSION}.tar.gz 
    cd abyss-${REMOTEVERSION}/
    module load gcc/6.3.0
    module load openmpi/2.1.0
    module load boost/1.63.0_gcc6.3.0
    module load sparsehash/2.0.3
    module load sqlite/3.16.2
    ./configure --enable-maxk=$MAXK --prefix=$PFX
    make -j 8
    make install


