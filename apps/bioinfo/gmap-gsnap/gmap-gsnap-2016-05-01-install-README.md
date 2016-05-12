# gmap-gsnap-2016-05-01-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    GMAP and GSNAP 2016-05-01

DESCRIPTION
-----------

    GMAP and GSNAP alignment tools

    Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
    for mRNA and EST sequences. Bioinformatics 21:1859-1875.

    Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
    variants and splicing in short reads.  Bioinformatics 26:873-881.

WEBSITE
-------

    http://research-pub.gene.com/gmap/

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/gmap-gsnap/2016-05-01/$Cluster/bin to the user's PATH

LOG
---

    TOOL=/sw/apps/bioinfo/gmap-gsnap
    VERSION=2016-05-01
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    wget http://research-pub.gene.com/gmap/src/gmap-gsnap-$VERSION.tar.gz
    tar xvzf gmap-gsnap-$VERSION.tar.gz
    cd gmap-$VERSION
    module load gcc/5.3.0 bzip2/1.0.6 zlib/1.2.8
    ./configure --prefix="/sw/apps/bioinfo/gmap-gsnap/2016-05-01/$CLUSTER" MAX_READLENGTH=20000
    make && make check && make install

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Reuse the previous mf.
