spades/3.13.1
=============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://cab.spbu.ru/software/spades/>

This is a new website for SPAdes.

Log
---

    VERSION=3.13.1
    cd /sw/bioinfo
    mkdir -p spades
    cd spades
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://cab.spbu.ru/files/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz
    tar xzf SPAdes-${VERSION}-Linux.tar.gz 
    cd SPAdes-${VERSION}-Linux/
    cd bin/

Check for shared objects.

    ldd *

None.  Note that spades_init.py is a locally-used package and need not be executable.

Check `#!` lines of python scripts.  Not needed here.

    head -n 1 *.py

Move `bin` and `share` to cluster directory.

    cd ..
    mv bin share ${PREFIX}/
    cd ..
    rmdir SPAdes-${VERSION}-Linux/

The mf file from previous versions should work.
