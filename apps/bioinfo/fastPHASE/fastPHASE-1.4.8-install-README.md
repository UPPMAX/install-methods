fastPHASE/1.4.8
===============

Included example input files from 1.4.0.  See its README for where they originally came from.

<http://scheet.org/software.html>

LOG
---

    VERSION=1.4.8
    cd /sw/apps/bioinfo/fastPHASE
    mkdir $VERSION
    cd $VERSION
    mkdir rackham
    PFX=$PWD/rackham
    for C in milou irma bianca ; do ln -s rackham $C; done
    mkdir src
    cd src
    wget http://scheet.org/code/Linuxfp.tar.gz
    tar xzf Linuxfp.tar.gz 
    cp -av fastPHASE $PFX/
    chmod +x $PFX/fastPHASE
    cd $PFX
    mkdir doc
    cd doc
    wget http://scheet.org/code/fastphase_doc_1.4.pdf
    cd ..
    mkdir data
    cd data
    cp -av /sw/apps/bioinfo/1.4.0/rackham/data/*.inp .
