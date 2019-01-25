cegma/2.5
=========

<http://korflab.ucdavis.edu/datasets/cegma/>

LOG
---

    cd /sw/apps/bioinfo/cegma
    mkdir 2.5
    cd 2.5
    mkdir src
    cd src
    wget http://korflab.ucdavis.edu/datasets/cegma/CEGMA_v2.5.tar.gz
    tar xzf CEGMA_v2.5.tar.gz
    mv CEGMA_v2.5 ../milou
    cd ../milou
    module load bioinfo-tools
    module add wise2/2.4.1
    module add hmmer/3.1b2
    module add geneid/1.4.4
    module add blast/2.2.31+
    make

Leave in place, and make links for other systems..

