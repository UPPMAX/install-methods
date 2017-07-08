bowtie/1.2.0
=============

LOG
---

    VERSION=1.2.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/bowtie
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f bowtie-${VERSION%.0}-source.zip ]] || wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie/$VERSION/bowtie-${VERSION%.0}-source.zip
    unzip bowtie-${VERSION%.0}-source.zip
    mv bowtie-${VERSION%.0} bowtie-${VERSION%.0}-${CLUSTER}
    cd bowtie-${VERSION%.0}-${CLUSTER}

Bowtie prefers to use the TBB library for threads, and finds it on milou
with `-ltbb` but it wants to use `-ltbbmalloc_proxy` but this is not on
milou.  So edit the `Makefile` to use `-ltbbmalloc` instead.

On rackham, this is not necessary.  `libtbbmalloc_proxy.so` loads
`libtbbmalloc.so`. 

    vi Makefile 

    module load gcc/5.4.0

    make -j 4
    make prefix=$PFX install
    cp -av scripts $PFX/


