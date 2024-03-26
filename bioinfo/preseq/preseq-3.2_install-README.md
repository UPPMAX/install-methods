preseq/3.2
========================

<https://github.com/smithlabcode/preseq>

Used under license:
GPL v3


Structure creating script (makeroom_preseq_3.2.sh) moved to /sw/bioinfo/preseq/makeroom_3.2.sh

LOG
---

    TOOL=preseq
    VERSION=3.2
    makeroom.sh -t $TOOL -v $VERSION -w https://github.com/smithlabcode/preseq -l "GPL v3" -d " is aimed at predicting the yield of distinct reads from a genomic library from an initial sequencing experiment. The estimates can then be used to examine the utility of further sequencing, optimize the sequencing depth, or to screen multiple libraries to avoid low complexity samples." -f

    ./makeroom_preseq_3.2.sh
    source /sw/bioinfo/preseq/SOURCEME_preseq_3.2 && cd $SRCDIR
    wget https://github.com/smithlabcode/preseq/releases/download/v3.2.0/preseq-3.2.0.tar.gz
    tar xzvf preseq-3.2.0.tar.gz
    rm preseq-3.2.0.tar.gz
    cd preseq-3.2.0/
    ml gcc/11.3.0 
    ml bioinfo-tools samtools/1.19 htslib/1.19
    mkdir build && cd build
Build with hts enables
    ../configure --prefix=$PREFIX --enable-hts
    make 
    make install
    cd ..
    cp -r docs $PREFIX/
    cp -r data $PREFIX/
Test
    make module (no dependenvies needed)
    ml preseq
    cd $PREFIX/data
    preseq lc_extrap -o yield_estimates.txt SRR1003759_5M_subset.mr
    preseq lc_extrap -B -o yield_estimates.txt SRR1106616_5M_subset.bam
    preseq lc_extrap -H -o yield_estimates.txt SRR1301329_1M_hist.txt
    


