# spades-3.7.0-install-README.md

spades/3.7.0
============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://bioinf.spbau.ru/spades>

Log
---

    cd /sw/apps/bioinfo/spades/
    mkdir 3.7.0
    cd 3.7.0/
    mkdir milou src
    cd src
    wget http://spades.bioinf.spbau.ru/release3.7.0/SPAdes-3.7.0-Linux.tar.gz
    tar xzf SPAdes-3.7.0-Linux.tar.gz 
    cd SPAdes-3.7.0-Linux/
    cd bin/

Check for shared objects.

    ldd *

None.  Copy to cluster directory.

    mv * ../../milou/
    cd ../../milou/

Check `#!` lines of python scripts.

    vi spades.py 
    vi truspades.py 
    vi dipspades.py 

No problems.  Symlinks for other clusters.

    cd ..
    ln -s ./milou halvan
    ln -s ./milou nestor
    ln -s ./milou tintin

Anything special in mf?

    cd ../../mf

Nope.  Link for new version, and same for existing mf.

    ln -s 2.5.1 3.7.0

