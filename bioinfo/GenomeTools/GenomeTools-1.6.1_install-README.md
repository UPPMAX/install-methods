GenomeTools/1.6.1
========================

<http://genometools.org/>

Used under license:
ISC

Structure creating script (makeroom_GenomeTools_1.6.1.sh) moved to /sw/bioinfo/GenomeTools/makeroom_1.6.1.sh

LOG
---

    TOOL=GenomeTools
    VERSION=1.6.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/GenomeTools/1.6.1/src
    /home/douglas/bin/makeroom.sh -f" -t "GenomeTools" -v "1.6.1" -s "misc" -w "http://genometools.org/" -l "ISC" -d "free collection of bioinformatics tools \(in the realm of genome informatics\) combined into a single binary named gt"
    ./makeroom_GenomeTools_1.6.1.sh
GenomeTools/1.4.9
=================

<http://genometools.org>

Log
---


    CLUSTER=rackham
    TOOL=/sw/apps/bioinfo/GenomeTools
    VERSION=1.5.9
    OTHERCLUSTERS="irma bianca"

    mkdir -p $TOOL/$VERSION/$CLUSTER $TOOL/src

    cd $TOOL/src
    wget http://genometools.org/pub/genometools-$VERSION.tar.gz
    tar xf genometools-$VERSION.tar.gz
    cd genometools-$VERSION
    make
    mv bin ../../$VERSION/$CLUSTER
    mv lib ../../$VERSION/$CLUSTER
    cd ..
    rm -rf genometools-$VERSION

    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done

    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION
