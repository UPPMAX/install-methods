TreeMix 1.12
============

A method for inferring the patterns of population splits and mixtures in the history of a set of populations.

<https://bitbucket.org/nygcresearch/treemix/wiki/Home>
<http://pritchardlab.stanford.edu/software.html>


Log
---

    cd /sw/apps/bioinfo
    mkdir -p TreeMix/1.12
    cd TreeMix/1.12/
    mkdir milou tintin
    ln -s ./milou nestor
    ln -s ./milou halvan
    cd src
    wget https://bitbucket.org/nygcresearch/treemix/downloads/treemix-1.12.tar.gz
    tar xzf treemix-1.12.tar.gz 
    mv treemix-1.12 treemix-1.12-milou
    cd treemix-1.12-milou
    module load gcc/4.9.2
    module load zlib/1.28
    module load boost/1.59.0_gcc4.9.2
    ./configure --prefix=/sw/apps/bioinfo/TreeMix/1.12/milou
    make
    make install

Repeat for tintin.

Use any mf and add $modroot/bin to PATH.

