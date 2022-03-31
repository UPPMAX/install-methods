infernal/1.1.4
==============

<http://eddylab.org/infernal/>

Used under license:



Structure creating script (makeroom_infernal_1.1.4.sh) moved to /sw/bioinfo/infernal/makeroom_1.1.4.sh

LOG
---

    makeroom.sh -f -t infernal -v 1.1.4 -w http://eddylab.org/infernal/ -d "Infernal ("INFERence of RNA ALignment") is for searching DNA sequence databases for RNA structure and sequence similarities" -l "BSD-style" -L http://eddylab.org/infernal/LICENSE
    ./makeroom_infernal_1.1.4.sh 
    source /sw/bioinfo/infernal/SOURCEME_infernal_1.1.4 && cd $SRCDIR
    wget http://eddylab.org/infernal/infernal-1.1.4.tar.gz
    tar xf infernal-1.1.4.tar.gz 
    cd infernal-1.1.4/
    ml gcc/9.3.0
    ./configure --prefix=$PREFIX
    make
    make check
    make install
    cd $PREFIX
    cd share/doc/infernal
    wget http://eddylab.org/infernal/Userguide.pdf
    wget http://eddylab.org/infernal/RELEASE-1.1.4.md
    wget http://eddylab.org/infernal/README.md

