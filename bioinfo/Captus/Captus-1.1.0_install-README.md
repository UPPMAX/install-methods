Captus/1.1.0
========================

<https://github.com/edgardomortiz/Captus>

Used under license:
GPL-3.0


Structure creating script (makeroom_Captus_1.1.0.sh) moved to /sw/bioinfo/Captus/makeroom_1.1.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "Captus" "-v" "1.1.0" "-w" "https://github.com/edgardomortiz/Captus" "-l" "GPL-3.0" "-d" "Assembly of Phylogenomic Datasets from High-Throughput Sequencing data" "-s" "assembly"
    ./makeroom_Captus_1.1.0.sh
    source /sw/bioinfo/Captus/SOURCEME_Captus_1.1.0 && cd $TOOLDIR
    cd $PREFIX
    ml conda
    conda create --prefix=$PREFIX/captus  -c bioconda -c conda-forge captus
    
    //in mf file
    load conda
    set CONDA_ENVS_PATH to $modroot

    //user activates env after loading (in ml help)
    . activate captus
