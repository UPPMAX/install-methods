smudgeplot/0.4.0
========================

<https://github.com/KamilSJaron/smudgeplot>

Used under license:
Apache-2.0


Structure creating script (makeroom_smudgeplot_0.4.0.sh) moved to /sw/bioinfo/smudgeplot/makeroom_0.4.0.sh

LOG
---

    makeroom.sh "-t" "smudgeplot" "-v" "0.4.0" "-w" "https://github.com/KamilSJaron/smudgeplot" "-l" "Apache-2.0" "-d" "Inference of ploidy and heterozygosity structure using whole genome sequencing data" "-s" "misc" "-f"
    ./makeroom_smudgeplot_0.4.0.sh
    source /sw/bioinfo/smudgeplot/SOURCEME_smudgeplot_0.4.0 && cd $SRCDIR
    wget https://github.com/KamilSJaron/smudgeplot/archive/refs/tags/v0.4.0.tar.gz
    tar xvzf v0.4.0.tar.gz
    cd smudgeplot-0.4.0/

    ml R_packages/4.3.1 #gives gcc/12.3.0
    make -s INSTALL_PREFIX='/sw/bioinfo/smudgeplot/0.4.0/rackham' exec/hetmers
    mkdir $PREFIX/bin
    install -C exec/smudgeplot.py $PREFIX/bin
    install -C exec/hetmers $PREFIX/bin
    install -C exec/smudgeplot_plot.R $PREFIX/bin
    install -C exec/centrality_plot.R $PREFIX/bin

    # Let module depend on Python module, R_packages/4.3.1 , and fastK
    Test avail here: https://github.com/KamilSJaron/smudgeplot?tab=readme-ov-file#runing-this-version-on-sacharomyces-data
    Test dir is created in $TOOLDIR
