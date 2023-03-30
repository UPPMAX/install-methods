hh-suite/3.3.0
========================

<https://github.com/soedinglab/hh-suite>

Used under license:
GNU3


Structure creating script (makeroom_hh-suite_3.3.0.sh) moved to /sw/bioinfo/hh-suite/makeroom_3.3.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hh-suite" "-v" "3.3.0" "-w" "https://github.com/soedinglab/hh-suite" "-d" "The HH-suite is an open-source software package for sensitive protein sequence searching based on the pairwise alignment of hidden Markov models" "-l" "GNU3" "-s" "annotation"
    ./makeroom_hh-suite_3.3.0.sh

    TOOL    =hh-suite
    VERSION =3.3.0

# Download
    cd $SRCDIR
    git clone https://github.com/soedinglab/hh-suite.git .
    git checkout v3.3.0

# Build. I dont know how to compile without avx2 on snowy. Login to snowy and compile it again with PREFIX on snowy
    rm $TOOLDIR/snowy
    module load gcc/12.2.0 cmake/3.22.2
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make -j 20 &&  make install




