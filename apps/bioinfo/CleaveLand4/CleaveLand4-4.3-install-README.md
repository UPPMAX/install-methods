# CleaveLand4-4.3-install-README.md

CleaveLand4/4.3

<http://sites.psu.edu/axtell/software/cleaveland4/>

<https://github.com/MikeAxtell/CleaveLand4>

LOG
---

We needn's set CLUSTER, because either milou or tintin are fine.

    VERSION=4.3
    cd /sw/apps/bioinfo
    mkdir -p CleaveLand4
    cd CleaveLand4
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir -p milou
    ln -s ./milou tintin
    mkdir -p src
    cd src
    wget https://github.com/MikeAxtell/CleaveLand4/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd CleaveLand4-${VERSION}/

Copy the scripts and documentation up to the cluster directory.

    cp CleaveLand4.pl CleaveLand4_TUTORIAL.pdf ../../milou/
    cp README ../../milou/README.CleaveLand4
    cd GSTAr_v1-0/
    cp GSTAr.pl ../../../milou/
    cp README ../../../milou/README.GSTAr

Set up the mf so that it loads bowtie/1.1.2, ViennaRNA/2.2.5, and samtools/0.1.19.

