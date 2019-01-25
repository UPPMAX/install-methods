pblat-cluster 0.1
=================

MPI blat

<http://icebert.github.io/pblat-cluster/>

Log
---

    cd /sw/apps/bioinfo
    mkdir pblat-cluster
    cd pblat-cluster
    mkdir 0.1 mf
    cd 0.1
    mkdir milou src
    cd src
    wget https://github.com/icebert/pblat-cluster/archive/0.1.tar.gz
    tar xzf 0.1.tar.gz 
    cd pblat-cluster-0.1/
    module load gcc/4.9.2
    module load openmpi/1.8.4
    make
    cp pblat-cluster ../../milou/
    cd ../..
    ln -s ./milou halvan
    ln -s ./milou nestor

Having trouble getting tintin to build with gcc/4.9.2 and openmpi/1.8.4,
submitted ticket #126187.

Expand mf file by loading gcc/4.9.2 and openmpi/1.8.4.

