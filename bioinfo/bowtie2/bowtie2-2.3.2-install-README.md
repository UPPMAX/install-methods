bowtie2/2.3.2
=============

LOG
---

    VERSION=2.3.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/bowtie2
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f bowtie2-${VERSION}-source.zip ]] || wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/$VERSION/bowtie2-${VERSION}-source.zip
    unzip bowtie2-${VERSION}-source.zip
    mv bowtie2-${VERSION} bowtie2-${VERSION}-${CLUSTER}
    cd bowtie2-${VERSION}-${CLUSTER}

Bowtie2 prefers to use the TBB library for threads, and finds it on milou
with `-ltbb` but it wants to use `-ltbbmalloc_proxy` but this is not on
milou.  So edit the `Makefile` to use `-ltbbmalloc` instead.

On rackham, this is not necessary.  `libtbbmalloc_proxy.so` loads
`libtbbmalloc.so`. 

    vi Makefile 

    module load gcc/5.4.0

    make -j 4
    make prefix=$PFX install

