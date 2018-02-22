spades/3.11.1
=============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://cab.spbu.ru/software/spades/>

This is a new website for SPAdes.

Log
---

    VERSION=3.11.1
    CLUS=rackham
    cd /sw/apps/bioinfo/spades/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUS} src
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
    mv bin share ../../${CLUS}/

Symlinks for other clusters.

    cd ../..
    for C in milou irma bianca ; do ln -s $CLUS $C; done

Anything special in mf?

    cd ../mf

Nope.  Link for new version, and same for existing mf.

    ln -s 2.5.1 ${VERSION}

