# gmap-gsnap-2014-01-21-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    GMAP and GSNAP 2014-01-21

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

    Simply add /sw/apps/bioinfo/AAT/r03052011/milou/bin to the user's PATH

LOG
---

    TOOL=/sw/apps/bioinfo/gmap-gsnap
    VERSION=2014-01-21
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    mkdir mf src
    cd src
    wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2014-01-21.tar.gz
    tar xvzf gmap-gsnap-2014-01-21.tar.gz
    cd gmap-2014-01-21
    ./configure --prefix="/sw/apps/bioinfo/gmap-gsnap/2014-01-21/milou" MAX_READLENGTH=1000
    make && make check && make install

Note that by default this defines GMAPDB="/sw/apps/bioinfo/gmap-gsnap/2014-01-21/milou/share",
so if we download prebuilt GMAP DBs, and I think we should provide some/all, then that is
where they should go.  We download the one available, for hg19.

    cd $CLUSTERDIR
    mkdir share
    cd share
    wget http://research-pub.gene.com/gmap/genomes/hg19.tar.gz
    tar xvzf hg19.tar.gz
    mv hg19.tar.gz ../src
    

We need to add $CLUSTERDIR/bin to PATH in the mf.

    cd ../mf
    # etc...

