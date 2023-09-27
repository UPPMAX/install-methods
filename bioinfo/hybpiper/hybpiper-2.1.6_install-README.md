hybpiper/2.1.6
========================

<https://github.com/mossmatters/HybPiper>

Used under license:
GPLv3


Structure creating script (makeroom_hybpiper_2.1.6.sh) moved to /sw/bioinfo/hybpiper/makeroom_2.1.6.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hybpiper" "-v" "2.1.6" "-w" "https://github.com/mossmatters/HybPiper" "-l" "GPLv3" "-d" "Recovering genes from targeted sequence capture data" "-s" "annotation"
    ./makeroom_hybpiper_2.1.6.sh

    module load python/3.11.4

    # Download
    cd $SRCDIR
    git clone https://github.com/mossmatters/HybPiper.git .
    git reset --hard v2.1.6

    PYTHONUSERBASE=$PREFIX pip3 install . --user




    # Conda test
    module load conda
    conda create -p $PREFIX
    conda config --add channels defaults
    conda config --add channels bioconda
    conda config --add channels conda-forge
    conda activate hybpiper
