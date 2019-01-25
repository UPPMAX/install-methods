# spades-3.7.1-install-README.md

spades/3.7.1
============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://bioinf.spbau.ru/spades>

Log
---

    VERSION=3.7.1
    CLUSTER=milou
    cd /sw/apps/bioinfo/spades/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER} src
    cd src
    wget http://spades.bioinf.spbau.ru/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz
    tar xzf SPAdes-${VERSION}-Linux.tar.gz 
    cd SPAdes-${VERSION}-Linux/
    cd bin/

Check for shared objects.

    ldd *

None.  Note that spades_init.py is a locally-used package and need not be executable.

Check `#!` lines of python scripts.

    vi spades.py 
    vi truspades.py 
    vi dipspades.py 

Move `bin` and `share` to cluster directory.

    cd ..
    mv bin share ../../../${CLUSTER}/

Symlinks for other clusters.

    cd ../..
    ln -s ./${CLUSTER} irma
    ln -s ./${CLUSTER} tintin

Anything special in mf?

    cd ../mf

Nope.  Link for new version, and same for existing mf.

    ln -s 2.5.1 ${VERSION}

