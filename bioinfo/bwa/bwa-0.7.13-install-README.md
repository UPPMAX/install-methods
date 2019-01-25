# bwa-0.7.13-install-README.md

bwa/0.7.13
==========

<https://github.com/lh3/bwa/releases/tag/v0.7.13>


Log
---

    cd /sw/apps/bioinfo/bwa
    mkdir 0.7.13
    cd 0.7.13/
    mkdir src milou tintin
    mkdir -p milou/bin milou/man/man1
    mkdir -p tintin/bin tintin/man/man1
    cd src
    wget https://github.com/lh3/bwa/releases/download/v0.7.13/bwa-0.7.13.tar.bz2
    tar xjf bwa-0.7.13.tar.bz2 
    module load gcc/4.9.2
    module load zlib/1.2.8
    make
    cp bwa *.pl ../../../0.7.13/milou/bin/
    cp bwa.1 ../../../0.7.13/milou/man/man1


Repeat build and copy for tintin.
