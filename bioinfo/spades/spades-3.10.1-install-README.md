spades/3.10.1
=============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://cab.spbu.ru/software/spades/>

This is a new website for SPAdes.

Log
---

    VERSION=3.10.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/spades/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER} src
    cd src
    wget http://cab.spbu.ru/files/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz
    tar xzf SPAdes-${VERSION}-Linux.tar.gz 
    cd SPAdes-${VERSION}-Linux/
    cd bin/

Check for shared objects.

    ldd *

None.  Note that spades_init.py is a locally-used package and need not be executable.

Check `#!` lines of python scripts.  Not needed here.

    vi spades.py truspades.py dipspades.py 

Move `bin` and `share` to cluster directory.

    cd ..
    mv bin share ../../${CLUSTER}/

Symlinks for other clusters.

    cd ../..
    ln -s ./${CLUSTER} rackham
    ln -s ./${CLUSTER} irma
    ln -s ./${CLUSTER} bianca

Anything special in mf?

    cd ../mf

Nope.  Link for new version, and same for existing mf.

    ln -s 2.5.1 ${VERSION}

