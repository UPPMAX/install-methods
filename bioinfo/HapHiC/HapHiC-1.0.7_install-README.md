HapHiC/1.0.7
========================

<https://github.com/zengxiaofei/HapHiC>

Used under license:
BSD-3


Structure creating script (makeroom_HapHiC_1.0.7.sh) moved to /sw/bioinfo/HapHiC/makeroom_1.0.7.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "HapHiC" "-v" "1.0.7" "-d" "HapHiC: a fast, reference-independent, allele-aware scaffolding tool based on Hi-C data" "-l" "BSD-3" "-w" "https://github.com/zengxiaofei/HapHiC" "-s" "annotation"

    # Load modules
    module load gcc/10.3.0
    module load conda/latest

    # Download
    cd $SRCDIR
    wget https://github.com/zengxiaofei/HapHiC/archive/refs/tags/v1.0.7.tar.gz

    # Create conda environment. " To ensure a successful installation, please set up the HapHiC Conda environment strictly in accordance with the approach above." 
    cd $PREFIX
    conda env create -f $SRCDIR/HapHiC-1.0.7/conda_env/environment_py310.yml -p $PREFIX/conda

    # Move src-content to $PREFIX
    mv $SRCDIR/HapHiC-1.0.7/* $PREFIX


    # Check
    conda activate $PREFIX/conda/HapHic
    $PREFIX/haphic check




