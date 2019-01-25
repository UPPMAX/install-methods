# A5-miseq-20160825-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    A5-miseq 20160825

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

    Add /sw/apps/bioinfo/A5-miseq/20160825/$Cluster/bin to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/A5-miseq
    VERSION=20160825
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    ln -s $CLUSTER tintin
    ln -s $CLUSTER rackham
    mkdir mf src
    cd src
    wget http://sourceforge.net/projects/ngopt/files/a5_miseq_linux_20160825.tar.gz
    mv download a5_miseq_linux_20160825.tar.gz
    tar xvzf a5_miseq_linux_20160825.tar.gz
    mv a5_miseq_linux_20160825/* $CLUSTERDIR/
    rmdir a5_miseq_linux_20160825

Edit the grep within the script to avoid the GREP_COLOR issue in ticket #142341.


    milou-b: /sw/apps/bioinfo/A5-miseq/20160825/milou/bin $ diff ../../src/a5_miseq_linux_20160825/bin/a5_pipeline.pl a5_pipeline.pl
    386c386
    <       if ($inf =~ /      Memory: (\d+) GB/){
    ---
    >       if ($inf =~ /      .*Memory.*: (\d+) GB/){
    391c391
    <       if ($inf =~ /MemTotal:\s+(\d+) kB/){
    ---
    >       if ($inf =~ /MemTotal.*:\s+(\d+) kB/){

