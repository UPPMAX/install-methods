gapseq/1.1
========================

<https://github.com/jotech/gapseq>

Used under license:
GNU3.0
<>

Structure creating script (makeroom_gapseq_1.1.sh) moved to /sw/bioinfo/gapseq/makeroom_1.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "gapseq" -v "1.1" -w "https://github.com/jotech/gapseq" -l "GNU3.0" -d "Informed prediction and analysis of bacterial metabolic pathways and genome-scale networks" -s "annotation"
    ./makeroom_gapseq_1.1.sh
    TOOL=gapseq
    version=1.1
    cd /sw/bioinfo/${TOOL}/
    source SOURCEME_gapseq_${version}

    
    module load bioinfo-tools
    module load glpk/4.65
    module load blast/2.11.0+
    module load exonerate/2.4.0
    module load hmmer/3.2.1
    module load gnuparallel/20180822
    module load barrnap/0.9
    module load R_packages/4.0.4


    
    
    cd $PREFIX
    git clone https://github.com/jotech/gapseq.git .
    git checkout v1.1
     ./src/update_sequences.sh

# doall takes around ~ 14 hours.
     ./gapseq doall toy/myb71.fna


