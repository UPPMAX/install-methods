hmmer/3.4
=========

<http://hmmer.org/>

Used under license:
custom open-source
<https://raw.githubusercontent.com/EddyRivasLab/hmmer/master/LICENSE>

Structure creating script (makeroom_hmmer_3.4.sh) moved to /sw/bioinfo/hmmer/makeroom_3.4.sh

When installing this please pay attention to the full instructions. The easel tools need to be installed, too.

LOG
---

    makeroom.sh "-f" "-t" "hmmer" "-v" "3.4" "-l" "custom open-source" "-L" "https://raw.githubusercontent.com/EddyRivasLab/hmmer/master/LICENSE" "-w" "http://hmmer.org/" "-d" "HMMER is used for searching sequence databases for sequence homologs, and for making sequence alignments. It implements methods using probabilistic models called profile hidden Markov models (profile HMMs)."
    ./makeroom_hmmer_3.4.sh

    source /sw/bioinfo/hmmer/SOURCEME_hmmer_3.4 && cd $SRCDIR
    wget http://eddylab.org/software/hmmer/hmmer-3.4.tar.gz
    tar xf hmmer-3.4.tar.gz 
    cd hmmer-3.4/
    ml gcc/12.3.0
    echo $PREFIX
    ./configure --prefix=$PREFIX
    make
    make check
    make install
    cd easel
    make install
