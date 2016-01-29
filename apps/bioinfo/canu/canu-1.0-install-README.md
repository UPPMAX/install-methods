canu 1.0
========

Fork of Celera Assembler specialised for long noisy reads.

<ihttp://canu.readthedocs.org/en/latest/>

Log
---

    cd /sw/apps/bioinfo/
    mkdir -p canu/1.0
    cd canu/1.0/
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src/
    wget https://github.com/marbl/canu/archive/v1.0.tar.gz
    module load gcc/4.9.2
    module load zlib/1.2.8
    tar xzf v1.0.tar.gz 
    mv canu-1.0 canu-1.0-milou
    cd canu-1.0-milou
    cd src/
    make -j 8
    cd ..
    mv Linux-amd64 ../../milou/

Repeat for tintin.

Use mf from cabog.

