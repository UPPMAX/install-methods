SHAPEIT v2.r837
===============

Haplotype phasing.

<https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.html>

LOG
---

    VERSION=v2.r837
    cd /sw/apps/bioinfo/
    mkdir SHAPEIT
    cd SHAPEIT/
    mkdir $VERSION
    cd $VERSION
    mkdir milou
    ln -s milou tintin
    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.${VERSION}.GLIBCv2.12.Linux.static.tgz
    tar xzf shapeit.${VERSION}.GLIBCv2.12.Linux.static.tgz 
    cp -av LICENCE bin example ../milou/
    cd ..

Use mf from IMPUTE2 and add message about availability of example data.

    cd ..
    mkdir mf
    cd mf
    cp ../../IMPUTE2/mf/2.3.2 v2.r837
    vi v2.r837 
