phylobayes/4.1c
===============

<http://megasun.bch.umontreal.ca/People/lartillot/www/download.html>

LOG
---

    VERSION=4.1c
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir phylobayes
    cd phylobayes
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f phylobayes${VERSION}.tar.gz ]] || wget http://megasun.bch.umontreal.ca/People/lartillot/www/phylobayes${VERSION}.tar.gz
    tar xzf phylobayes${VERSION}.tar.gz 
    cd phylobayes${VERSION}
    module load gcc/5.3.0
    cd sources
    make clean
    make -j 8
    cd ../data
    cp -av * $PFX/
    cd ../..
    rm -rf phylobayes${VERSION}

Begin with mf file from `phylobayesmpi/1.8`; don't load gcc or openmpi.
