gmap-gsnap/2017-09-11
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
    VERSION=2017-09-11
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
    module load gcc/6.3.0 bzip2/1.0.6 zlib/1.2.11
    ./configure --prefix="$PFX" MAX_READLENGTH=20000
    make -j 8 && make check && make install
    cd ..
    rm -rf gmap-$VERSION

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Reuse the previous mf.
