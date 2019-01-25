gmap-gsnap/2014-01-21
=====================

GMAP and GSNAP alignment tools

Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
for mRNA and EST sequences. Bioinformatics 21:1859-1875.

Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
variants and splicing in short reads.  Bioinformatics 26:873-881.

<http://research-pub.gene.com/gmap/>


LOG
---

    TOOL=/sw/apps/bioinfo/gmap-gsnap
    VERSION=2014-01-21
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f gmap-gsnap-$VERSION.tar.gz ]] || wget http://research-pub.gene.com/gmap/src/gmap-gsnap-$VERSION.tar.gz
    tar xzf gmap-gsnap-$VERSION.tar.gz
    cd gmap-$VERSION
    ./configure --prefix="$PFX" MAX_READLENGTH=1000
    make && make check && make install
    cd ..
    rm -rf gmap-$VERSION

Note that by default this defines `GMAPDB=/sw/apps/bioinfo/gmap-gsnap/2014-01-21/milou/share`,
so if we download prebuilt GMAP DBs, and I think we should provide some/all, then that is
where they should go.  We download the one available, for hg19.

    cd $PFX
    mkdir share
    cd share
    wget http://research-pub.gene.com/gmap/genomes/hg19.tar.gz
    tar xvzf hg19.tar.gz
    rm -f hg19.tar.gz

