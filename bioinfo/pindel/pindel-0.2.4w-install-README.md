# pindel-0.2.4winstall-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    pindel 0.2.4w

DESCRIPTION
-----------

    Pindel 0.2.4w

    Ye K, Schulz MH, Long Q, Apweiler R, Ning Z. 2009. Pindel: a pattern growth
    approach to detect break points of large deletions and medium sized 
    insertions from paired-end short reads. Bioinformatics. 25(21):2865-2871.

WEBSITE
-------

    http://gmt.genome.wustl.edu/packages/pindel/

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/AAT/r03052011/milou/bin to the user's PATH

LOG
---

    TOOL=/sw/apps/bioinfo/pindel
    VERSION=0.2.4w
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    git clone git://github.com/genome/pindel.git
    cd pindel
    ./INSTALL /sw/apps/bioinfo/samtools/0.1.19/src
    cp Adaptor.pm bam2pindel.pl pindel pindel2vcf sam2pindel $CLUSTERDIR


For the mf, need to prepend $CLUSTERDIR to the path, and set
BAM_2_PINDEL_ADAPT, so Adaptor.pm can be found.  Adaptor.pm will also be found
if it is in the same directory as bam2pindel.pl which it is, but safer through
redundancy.

Now for tintin

    TOOL=/sw/apps/bioinfo/pindel
    VERSION=0.2.4w
    CLUSTER=tintin
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $VERSIONDIR
    cd src
    cd pindel
    make clean
    rm -f pindel pindel2vcf sam2pindel
    ./INSTALL /sw/apps/bioinfo/samtools/0.1.19/src
    cp Adaptor.pm bam2pindel.pl pindel pindel2vcf sam2pindel $CLUSTERDIR


