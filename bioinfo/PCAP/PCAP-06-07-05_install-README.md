# CAP3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    PCAP  (no version)

DESCRIPTION
-----------

    PCAP overlap assembler

    Huang X, Wang J, Aluru S, Yang S-P, Hillier L.  2003.  PCAP: A whole-genome 
    assembly program.  Genome Research 13(9): 2164–2170.

WEBSITE
-------

    http://seq.cs.iastate.edu/pcap.html

MODULE REQUIREMENTS
-------------------

Change so version is determined from tool itself.

    Simply add /sw/apps/bioinfo/PCAP/milou to the user PATH.  There is no
    version

LOG
---

    TOOL=/sw/apps/bioinfo/PCAP
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir mf src
    cd src
    wget http://seq.cs.iastate.edu/PCAP/pcap.rep.linux.xeon64.tar
    tar xvf pcap.rep.linux.xeon64.tar 
    cd pcap.rep.linux.xeon64/
    cp * ../../milou/
    cd ../../milou
    cp autopcap autopcap.orig
    mv autopcap autopcap.uppmax
    ln -s autopcap.milou autopcap

Now change path for programs used by autopcap (line 2) to be this directory. 

    vi autopcap.uppmax

Correct permissions.

    chmod -R g+rwX *
    chmod -R o+rX *

Steal an mf from another project, we need to add $CLUSTERDIR to PATH.

    cd ../mf
    cp /sw/apps/bioinfo/CAP3/mf/CAP3 PCAP
    vi PCAP

Now do the same for tintin, an Opteron-compiled version is also provided.

    cd ..
    mkdir tintin
    cd src
    wget http://seq.cs.iastate.edu/PCAP/pcap.rep.linux.opteron64.tar
    tar xvf pcap.rep.linux.opteron64.tar 
    cd pcap.rep.linux.opteron64/
    cp -av * ../../tintin/
    cd ../../tintin/
    cp autopcap autopcap.orig
    mv autopcap autopcap.tintin
    ln -s autopcap.tintin autopcap
    vi autopcap
    chmod -R g+rwX *
    chmod -R o+rX *
