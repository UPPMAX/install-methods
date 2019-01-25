# A5-miseq-20140604-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    A5-miseq 20140604

DESCRIPTION
-----------

    A5 pipeline for de novo assembly of microbial genomes

    Tritt A, Eisen JA, Facciotti MT, Darling AE.  2012.  An integrated pipeline for
    de novo assembly of microbial genomes.  PLoS ONE 8:e42304.

WEBSITE
-------

    https://code.google.com/p/ngopt/ (when published)
    http://sourceforge.net/projects/ngopt/   (now)

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/A5-miseq/20140604/$Cluster/bin to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/A5-miseq
    VERSION=20140604
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    ln -s $CLUSTER tintin
    ln -s $CLUSTER nestor
    mkdir mf src
    cd src
    wget http://sourceforge.net/projects/ngopt/files/a5_miseq_linux_20140604.tar.gz
    mv download a5_miseq_linux_20140604.tar.gz
    tar xvzf a5_miseq_linux_20140604.tar.gz
    mv a5_miseq_linux_20140604/* $CLUSTERDIR/
    rmdir a5_miseq_linux_20140604

This creates the directory $TOOL/$VERSION/a5_miseq_linux_20140604

Steal an mf from another project, we need to add $CLUSTERDIR/bin to PATH.

    cd ../mf
    # etc...

