phyluce/1.7.3
========================

<https://phyluce.readthedocs.io/en/latest/>

Used under license:
https://phyluce.readthedocs.io/en/latest/license.html#software


Structure creating script (makeroom_phyluce_1.7.3.sh) moved to /sw/bioinfo/phyluce/makeroom_1.7.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "phyluce" "-v" "1.7.3" "-w" "https://phyluce.readthedocs.io/en/latest/" "-l" "AS IS" "-l" "https://phyluce.readthedocs.io/en/latest/license.html#software" "-d" " is a software package for working with data generated from sequence capture of UCE (ultra-conserved element) loci" "-s" "misc"
    ./makeroom_phyluce_1.7.3.sh
    source /sw/bioinfo/phyluce/SOURCEME_phyluce_1.7.3 && cd $TOOLDIR
    cd $SRC
    ml conda
    wget https://raw.githubusercontent.com/faircloth-lab/phyluce/v1.7.3/distrib/phyluce-1.7.3-py36-Linux-conda.yml
    conda env create --$PREFIX/ phyluce-1.7.3 --file phyluce-1.7.3-py36-Linux-conda.yml
 
    //test
    muscle -version


    //in mf file
    load conda
    set CONDA_ENVS_PATH to $modroot

    //user activates env after loading (in ml help)
    . activate phyluce-1.7.3

