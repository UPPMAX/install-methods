gmap-gsnap/2018-07-04
=====================

GMAP and GSNAP alignment tools

Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
for mRNA and EST sequences. Bioinformatics 21:1859-1875.

Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
variants and splicing in short reads.  Bioinformatics 26:873-881.

<http://research-pub.gene.com/gmap/>


The `MAX_READLENGTH` change from the previous version applies.  See there
for more.

Also, for this version, updating to gcc/7.3.0 and removing the load of zlib and
bzip2 modules, since the system versions are sufficient.


LOG
---

    TOOL=/sw/apps/bioinfo/gmap-gsnap
    VERSION=2018-07-04
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CC in snowy bianca irma; do ln -s $CLUSTER $CC; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f gmap-gsnap-$VERSION.tar.gz ]] || wget http://research-pub.gene.com/gmap/src/gmap-gsnap-$VERSION.tar.gz
    [[ -d gmap-$VERSION ]] && rm -rf gmap-$VERSION
    tar xzf gmap-gsnap-$VERSION.tar.gz
    cd gmap-$VERSION
    module load gcc/7.3.0
    ./configure --prefix="$PFX" MAX_STACK_READLENGTH=20000
    make -j 10 && make check && make install
    cd ..
    rm -rf gmap-$VERSION

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Reuse the previous mf.
