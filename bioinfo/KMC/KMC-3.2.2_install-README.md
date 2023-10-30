KMC/3.2.2
=========

<https://github.com/refresh-bio/KMC>

Used under license:
GPL v3
<https://github.com/refresh-bio/KMC#license>

Structure creating script (makeroom_KMC_3.2.2.sh) moved to /sw/bioinfo/KMC/makeroom_3.2.2.sh

LOG
---

    makeroom.sh -t KMC -v 3.2.2 -c bioinfo -s misc -l "GPL v3" -L https://github.com/refresh-bio/KMC#license -d "A disk-based program for counting k-mers from (possibly gzipped) FASTQ/FASTA files"
    ./makeroom_KMC_3.2.2.sh 
    source /sw/bioinfo/KMC/SOURCEME_KMC_3.2.2
    cd $SRCDIR
    wget https://github.com/refresh-bio/KMC/releases/download/v3.2.2/KMC3.2.2.linux.x64.tar.gz
    tar xf KMC3.2.2.linux.x64.tar.gz 
    bin/kmc

Runs. The tarball includes a static library and an include file. Reposition the library
into a lib/ directory after moving.

    mv bin include $PREFIX/
    cd $PREFIX
    mkdir lib
    mv bin/libkmc_core.a lib/


    cd $TOOLDIR
    ./KMC-3.2.2_post-install.sh 

