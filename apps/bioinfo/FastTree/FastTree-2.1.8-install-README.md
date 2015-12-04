    cd /sw/apps/bioinfo/
    mkdir FastTree
    cd FastTree
    mkdir 2.1.8
    cd 2.1.8
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget http://www.microbesonline.org/fasttree/FastTree-2.1.8.c
    module load gcc/4.9.2
    gcc -O3 -finline-functions -funroll-loops -Wall -o FastTree FastTree-2.1.8.c -lm
    gcc -DOPENMP -fopenmp -O3 -finline-functions -funroll-loops -Wall -o FastTreeMP FastTree-2.1.8.c -lm
    cp FastTree FastTreeMP ../milou/

