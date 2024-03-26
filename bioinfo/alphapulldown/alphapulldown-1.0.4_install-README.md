alphapulldown/1.0.4
========================

<https://github.com/KosinskiLab/AlphaPulldown>

Used under license:
GPL-3.0


Structure creating script (makeroom_alphapulldown_1.0.4.sh) moved to /sw/bioinfo/alphapulldown/makeroom_1.0.4.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphapulldown" "-v" "1.0.4" "-d" "AlphaPulldown is a Python package that streamlines protein-protein interaction screens and high-throughput modelling of higher-order oligomers using AlphaFold-Multimer" "-w" "https://github.com/KosinskiLab/AlphaPulldown" "-l" "GPL-3.0" "-s" "annotation"
    ./makeroom_alphapulldown_1.0.4.sh

    # 

    # On rackham1 load conda
    module load conda/latest
    cd $PREFIX
    conda create -p alphapulldown -c omnia -c bioconda -c conda-forge python==3.10 openmm==8.0 pdbfixer==1.9 kalign2 cctbx-base pytest importlib_metadata hhsuite
    conda activate /sw/bioinfo/alphapulldown/1.0.4/rackham/alphapulldown
    conda install -c bioconda hmmer
    python3 -m pip install alphapulldown==1.0.4 importlib_metadata



