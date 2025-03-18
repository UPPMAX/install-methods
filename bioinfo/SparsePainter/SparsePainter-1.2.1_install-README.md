SparsePainter/1.2.1
========================

<https://github.com/YaolingYang/SparsePainter>

Used under license:
GPL-3.0
<https://github.com/YaolingYang/SparsePainter/blob/main/LICENSE>

Structure creating script (makeroom_SparsePainter_1.2.1.sh) moved to /sw/bioinfo/SparsePainter/makeroom_1.2.1.sh

LOG
---

    /makeroom.sh "-t" "SparsePainter" "-v" "1.2.1" "-w" "https://github.com/YaolingYang/SparsePainter" "-d" "SparsePainter is an efficient tool for local ancestry inference (LAI) coded in C++. It extends PBWT algorithm to find K longest matches at each position, and uses the Hash Map structure to implement the forward and backward algorithm in the Hidden Markov Model (HMM) leveraging the sparsity of haplotype matches." "-l" "GPL-3.0" "-L" "https://github.com/YaolingYang/SparsePainter/blob/main/LICENSE" "-c" "bioinfo" "-s" "misc"
    ./makeroom_SparsePainter_1.2.1.sh
    cd $SRCDIR

    wget https://github.com/YaolingYang/SparsePainter/archive/refs/tags/v1.2.1.tar.gz
    tar xvf v1.2.1.tar.gz
    cd cd SparsePainter-1.2.1
    ml gcc/14.2.0 psatchelf
    make
    patchelf --set-rpath $LD_LIBRARY_PATH:/sw/bioinfo/SparsePainter/1.2.1/src/SparsePainter-1.2.1/armadillo-12.6.5 SparsePainter
    cd $PREFIX
    ln -s ../src/SparsePainter-1.2.1/SparsePainter

