# CAP3-install-README.md, douglas.scofield@ebc.uu.se

self-reported version 08/06/13 rendered here as 08-06-13

TITLE
=====

    CAP3  08-06-13

DESCRIPTION
-----------

    CAP3 overlap assembler

    Huang X, Madan A.  1999.  CAP3: A DNA sequence assembly program. Genome 
    Research 9: 868-877.

WEBSITE
-------

    http://seq.cs.iastate.edu/cap3.html

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/CAP3/milou to the user PATH.  There is no
    version

LOG
---

    TOOL=/sw/apps/bioinfo/CAP3
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir mf src
    cd src
    wget http://seq.cs.iastate.edu/CAP3/cap3.linux.x86_64.tar
    tar xvf cap3.linux.x86_64.tar 
    cd CAP3
    cp cap3 formcon ../../milou/

Steal an mf from another project, we need to add $CLUSTERDIR to PATH.

    cd ../../mf
    cp /sw/apps/bioinfo/MUMmer/mf/3.23 cap3
    vi cap3

The version is cap3, but there will never be another.
