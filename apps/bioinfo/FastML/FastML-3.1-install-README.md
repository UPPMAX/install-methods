    cd /sw/apps/bioinfo/
    mkdir FastML
    cd FastML/
    mkdir mf 3.1
    cd 3.1
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget http://fastml.tau.ac.il/source/FastML.v3.1.tgz
    tar xzvf FastML.v3.1.tgz 
    cd FastML.v3.1/
    module load gcc/4.9.2
    make
    mkdir bin
    make install

