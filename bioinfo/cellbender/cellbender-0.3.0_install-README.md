cellbender/0.3.0
========================

<https://cellbender.readthedocs.io/>

Used under license:
BSD-3
<https://github.com/broadinstitute/CellBender/blob/master/LICENSE>

Structure creating script (makeroom_cellbender_0.3.0.sh) moved to /sw/bioinfo/cellbender/makeroom_0.3.0.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "cellbender" "-v" "0.3.0" "-c" "bioinfo" "-s" "sw_collections" "-w" "https://cellbender.readthedocs.io/" "-d" "CellBender is a software package for eliminating technical artifacts from high-throughput single-cell RNA sequencing (scRNA-seq) data." "-l" "BSD-3" "-L" "https://github.com/broadinstitute/CellBender/blob/master/LICENSE"
    ./makeroom_cellbender_0.3.0.sh
    source /sw/bioinfo/cellbender/SOURCEME_cellbender_0.3.0 && cd $SRCDIR
    module load python/3.7.2
    python3 -m venv cellbender
    source cellbender/bin/activate
    python3 -m pip install -U pip setuptools
    python3 -m pip install cellbender
    cd $PREFIX
    ln -s ../src/cellbender/bin


