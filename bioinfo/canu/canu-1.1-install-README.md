canu 1.1
========

Fork of Celera Assembler specialised for long noisy reads.

<http://canu.readthedocs.org/en/latest/>

Log
---

    cd /sw/apps/bioinfo/
    mkdir -p canu/1.1
    cd canu/1.1/
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src/
    wget https://github.com/marbl/canu/archive/v1.1.tar.gz
    module load gcc/4.9.2
    module load zlib/1.2.8
    tar xzf v1.1.tar.gz 
    mv canu-1.1 canu-1.1-milou
    cd canu-1.1-milou
    cd src/
    make -j 8
    cd ..
    mv Linux-amd64 ../../milou/

Note that `$CLUSTER/Linux-amd64/bin/canu.defaults` now contains an additional line `useGrid=false`.

