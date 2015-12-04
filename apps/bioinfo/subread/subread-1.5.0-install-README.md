    cd /sw/apps/bioinfo/subread
    mkdir 1.5.0
    cd 1.5.0
    mkdir milou tintin src
    cd src
    wget http://sourceforge.net/projects/subread/files/subread-1.5.0/subread-1.5.0-source.tar.gz/download
    mv download subread-1.5.0-source.tar.gz
    tar xzf subread-1.5.0-source.tar.gz
    cd subread-1.5.0-source/
    cd src
    module load gcc/4.9.2
    make -f Makefile.Linux 
    mv bin ../../milou/

Make sure both bin and bin/utilities are in PATH.
