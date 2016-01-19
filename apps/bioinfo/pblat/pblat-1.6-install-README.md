pblat 1.6
=========

Parallel blat using pthreads.

<http://icebert.github.io/pblat/>

Log
---

    cd /sw/apps/bioinfo
    mkdir pblat
    cd pblat/
    mkdir 1.6 mf
    cd 1.6
    mkdir milou tintin src
    cd src
    wget https://github.com/icebert/pblat/archive/1.6.tar.gz
    tar xzf 1.6.tar.gz 
    cd pblat-1.6/
    module load gcc/4.9.2
    make
    cp pblat ../../milou/
    cd ../..
    ln -s ./milou halvan
    ln -s ./milou nestor

Same for tintin.

And use simple mf file.

    cp /sw/mf/common/bioinfo-tools/alignment/blat/35 1.6
    vi 1.6 
