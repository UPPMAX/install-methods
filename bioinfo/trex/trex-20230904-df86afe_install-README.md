trex/20230904-df86afe
========================

<https://github.com/frisen-lab/TREX>

Used under license:
MIT


Structure creating script (makeroom_trex_20230904-df86afe.sh) moved to /sw/bioinfo/trex/makeroom_20230904-df86afe.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "trex" "-v" "20230904-df86afe" "-w" "https://github.com/frisen-lab/TREX" "-l" "MIT" "-d" "Simultaneous lineage TRacking and EXpression profiling of single cells using RNA-seq" "-s" "annotation"
    ./makeroom_trex_20230904-df86afe.sh
trex/df86afe

    # Load modules
    module load python/3.9.5

    # Create virtual environment and git clone
    cd $PREFIX
    python3 -m venv trex-venv
    source $PREFIX/trex-venv/bin/activate

    cd $SRCDIR
    git clone https://github.com/frisen-lab/TREX.git .
    git reset --hard df86afe

    # Install and lift out trex
    pip install .
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/trex-venv/bin/trex .

    # Test
    cd $SRCDIR
    $PREFIX/bin/trex run10x -s 695 -e 724 tests/data/ --delete

