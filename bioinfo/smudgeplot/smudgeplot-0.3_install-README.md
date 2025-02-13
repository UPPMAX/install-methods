smudgeplot/0.3
========================

<https://github.com/KamilSJaron/smudgeplot>

Used under license:
Apache-2.0


Structure creating script (makeroom_smudgeplot_0.3.sh) moved to /sw/bioinfo/smudgeplot/makeroom_0.3.sh

LOG
---

    makeroom.sh "-t" "smudgeplot" "-v" "0.3" "-w" "https://github.com/KamilSJaron/smudgeplot" "-l" "Apache-2.0" "-d" "Inference of ploidy and heterozygosity structure using whole genome sequencing data" "-s" "misc"
    ./makeroom_smudgeplot_0.3.sh
    source /sw/bioinfo/smudgeplot/SOURCEME_smudgeplot_0.3 && cd $SRCDIR
    wget https://github.com/KamilSJaron/smudgeplot/archive/refs/tags/v0.3.0.tar.gz
    tar xvzf v0.3.0.tar.gz
    cd smudgeplot-0.3.0/

    # make manual installation, alternative is not working well
    ml R_packages/4.3.1 #gives gcc/12.3.0
    Rscript -e 'install.packages(".", repos = NULL, type="source",lib="/sw/bioinfo/smudgeplot/0.3/rackham/lib")'
    make -s INSTALL_PREFIX='/sw/bioinfo/smudgeplot/0.3/rackham' exec/PloidyPlot
    mkdir $PREFIX/bin
    cp exec/* $PREFIX/bin/

    # Let module depend on Python module, R/4.3.1 (packages not needed), and fastK

