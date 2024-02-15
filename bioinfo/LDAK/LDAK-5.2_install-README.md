LDAK/5.2
========================

<https://dougspeed.com/>

Used under license:
Open source AS IS


Structure creating script (makeroom_LDAK_5.2.sh) moved to /sw/bioinfo/LDAK/makeroom_5.2.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "LDAK" "-v" "5.2" "-w" "https://dougspeed.com/" "-c" "bioinfo" "-l" "Open source AS IS" "-d" "LDAK is a software package for analysing association study data. In total, it has over 30 different functions (see Main Arguments for a full list). " "-s" "annotation"
    ./makeroom_LDAK_5.2.sh
    source /sw/bioinfo/LDAK/SOURCEME_LDAK_5.2 && cd $SRCDIR
    wget https://dougspeed.com/wp-content/uploads/ldak5.2.linux_.zip
    unzip ldak5.2.linux_.zip
    mv ldak5.2.linux $PREFIX/ldak
    cd $PREFIX
    mkdir bin
    mv ldak bin/
    cd bin/
    # tutorials call ldak differently
    ln -s ldak ldak.linux
    ln -s ldak ldak5.2.linux
    ln -s ldak ldak5.2
    ln -s ldak ldak5.2.XXX
    ln -s ldak ldak5.XXX
    cd ..
   # test run
    mkdir test
    cd test
    wget https://www.dropbox.com/s/5vcfcree3xnvhew/data.zip
    unzip data.zip
    mkdir data
    mv * data/
    cd ..
   # run it after activating the module  
    cd $PREFIX/test
    ldak5.XXX --calc-stats human --bfile human
    # look in data folder to find 3 files called "human.{progress,stats,missing}"
