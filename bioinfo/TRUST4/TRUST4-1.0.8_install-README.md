TRUST4/1.0.8
========================

<https://github.com/liulab-dfci/TRUST4>

Used under license:
GPL-3.0
<https://github.com/liulab-dfci/TRUST4/blob/master/LICENSE.txt>

Structure creating script (makeroom_TRUST4_1.0.8.sh) moved to /sw/bioinfo/TRUST4/makeroom_1.0.8.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "TRUST4" "-v" "1.0.8" "-c" "bioinfo" "-s" "assembly" "-l" "GPL-3.0" "-L" "https://github.com/liulab-dfci/TRUST4/blob/master/LICENSE.txt" "-d" "Tcr Receptor Utilities for Solid Tissue (TRUST) is a computational tool to analyze TCR and BCR sequences using unselected RNA sequencing data, profiled from solid tissues, including tumors. TRUST4 performs de novo assembly on V, J, C genes including the hypervariable complementarity-determining region 3 (CDR3) and reports consensus of BCR/TCR sequences." "-w" "https://github.com/liulab-dfci/TRUST4"
    ./makeroom_TRUST4_1.0.8.sh
    cd $SRCDIR
    wget https://github.com/liulab-dfci/TRUST4/archive/refs/tags/v1.0.8.tar.gz
    tar -xvf v1.0.8.tar.gz -C $PREFIX  --strip-components 1
    module load gcc/11.3.0
    cd $PREFIX
    make

