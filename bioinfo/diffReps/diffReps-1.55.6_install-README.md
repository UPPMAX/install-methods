diffReps/1.55.6
========================

<http://>

Used under license:
Creative commons


Structure creating script (makeroom_diffReps_1.55.6.sh) moved to /sw/bioinfo/diffReps/makeroom_1.55.6.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "diffReps" "-v" "1.55.6" "-d" "ChIP-seq is now widely used to profile the protein DNA interactions on a genome." "-l" "Creative commons" "-s" "annotation"
    ./makeroom_diffReps_1.55.6.sh

    TOOL    =diffReps
    VERSION =1.55.6

# Download
    cd $SRCDIR
    wget https://github.com/shenlab-sinai/diffreps/archive/refs/tags/1.55.6.tar.gz
    tar xfvz 1.55.6.tar.gz --strip-components=1

# Load modules
    module load perl_modules/5.26.2

# Install
    perl Makefile.PL PREFIX=$PREFIX
    make -j 10
    make test
    make install

# Test
    cd $SRCDIR/Downloads
    tar xfvz ChIPseq.H3K9me3.Example.tar.gz
    diffReps.pl -tr h3k9me3.c* -co h3k9me3.sal.r* -gn mm9 -re diff.nb.txt -me nb --nproc 20

