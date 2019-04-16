LTR_Finder/1.0.7
================

Version 1.0.5 was available on milou under module name `ltr-finder`.  This
provides that for rackham and the newest version 1.0.7, together with a bunch
more tRNA sequences.

Begin by renaming:

    cd /sw/bioinfo
    mv ltr-finder LTR_Finder

LOG
---

    cd /sw/bioinfo/LTR_Finder
    VERSION=1.0.7
    mkdir $VERSION
    mkdir mf
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    mkdir $PFX/bin
    mkdir $PFX/GtRNAdb
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -sf $CLUSTER $CL; done
    mkdir src
    cd src

Get GtRNAdb contents and provide them.

    wget http://lowelab.ucsc.edu/download/tRNAs/GtRNAdb-all-tRNAs.fa.gz
    wget http://lowelab.ucsc.edu/download/tRNAs/eukaryotic-tRNAs.fa.gz
    wget http://lowelab.ucsc.edu/download/tRNAs/bacterial-tRNAs.fa.gz
    wget http://lowelab.ucsc.edu/download/tRNAs/archaeal-tRNAs.fa.gz
    for F in *.fa.gz ; do gunzip -dc $F > ${F%.gz}; done
    cp -av *.fa $PFX/GtRNAdb/

Now get the tool.

    module load git gcc/6.4.0
    git clone https://github.com/xzhub/LTR_Finder
    cd LTR_Finder

The github repository contains a prebuilt executable for `ltr_finder` (we are
ignoring it) and a tRNA database derived from GtRNAdb (we are including it).

    cd build
    tar xvzf LTR_FINDER.x86_64-1.0.7.tar.gz 
    cd LTR_FINDER.x86_64-1.0.7
    mv tRNA.list.txt tRNAdb/
    mv tRNAdb $PFX/
    cd ..

Now build it, and fix up the perl hash-bang lines.

    cd source/
    make clean
    make
    cp -av ltr_finder psearch *.pl $PFX/bin
    cd $PFX/bin
    vi *.pl
    chmod +x *.pl

The mf file has more info under module help.
