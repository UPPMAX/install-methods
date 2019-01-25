# fasta-36.3.6d-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    FASTA package of bioinformatics programs

DESCRIPTION
-----------

    FASTA package of bioinformatics programs

    W. R. Pearson and D. J. Lipman (1988), “Improved Tools for Biological Sequence
        Analysis”, PNAS 85:2444-2448, 
    W. R. Pearson (1996) “Effective protein sequence comparison” Meth.  Enzymol. 
        266:227-258
    Pearson et. al. (1997) Genomics 46:24-36

WEBSITE
-------

    http://faculty.virginia.edu/wrpearson/fasta/

MODULE REQUIREMENTS
-------------------

    Add to the user PATH:
        $CLUSTERDIR/bin
        $CLUSTERDIR/misc
        $CLUSTERDIR/scripts
    Add to the user MANPATH:
        $CLUSTERDIR/man

LOG
---

    TOOL=/sw/apps/bioinfo/fasta
    VERSION=36.3.6d
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    mkdir src
    cd src
    wget http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-36.3.6d.tar.gz
    tar xvzf fasta-36.3.6d.tar.gz
    cd fasta-36.3.6d
    mv * ../../milou/
    cd ../../milou

Set perms so others in sw can work on it.

    chmod -R g+w .

Following README instructions to build for linux 64-bit SSE2.

    cd src
    make -f ../make/Makefile.linux64_sse2 all

Test following README.

    ../bin/fasta36 -q ../seq/mgstm1.aa ../seq/prot_test.lseg

Seems to work, last few lines of output are

~~~~
218 residues in 1 query   sequences
2267 residues in 12 library sequences
 Tcomplib [36.3.6 Jan, 2014(preload9)] (16 proc in memory [0G])
 start: Sat May  3 17:21:36 2014 done: Sat May  3 17:21:36 2014
 Total Scan time:  0.010 Total Display time:  0.010

Function used was FASTA [36.3.6 Jan, 2014(preload9)]
~~~~

Set execute permissions for all scripts.

    cd $CLUSTERDIR/scripts
    chmod +x *.pl

Enable the usage of the formatted man pages.  Be sure to add $CLUSTERDIR/man to
the user MANPATH.

    cd $CLUSTERDIR
    mkdir man
    cd man
    ln -s ../doc man1

Steal an mf from another project and implement module requirements as described
above.

    cd $TOOL/mf  # out of milou/src
    cp ../../../delly/mf/0.0.11 36.3.6d
    vi 36.3.6d

