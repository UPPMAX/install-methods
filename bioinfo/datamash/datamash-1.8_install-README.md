datamash/1.8
========================

<https://www.gnu.org/software/datamash/download/>

Used under license:

<http://creativecommons.org/licenses/by-nd/3.0/us/>

Structure creating script (makeroom_datamash_1.8.sh) moved to /sw/bioinfo/datamash/makeroom_1.8.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "datamash" "-v" "1.8" "-c" "bioinfo" "-s" "misc" "-w" "https://www.gnu.org/software/datamash" "-L" "http://creativecommons.org/licenses/by-nd/3.0/us/" "-d" "Datamash is a grouping and summarizing tool on tabular data files"
    ./makeroom_datamash_1.8.sh

    source /sw/bioinfo/datamash/SOURCEME_datamash_1.8 && cd $TOOLDIR/$VERSION/src
    wget https://ftp.gnu.org/gnu/datamash/datamash-1.8.tar.gz
    tar -xzvf datamash-1.8.tar.gz
    cd datamash-1.8

    module load gcc/10.3.0
    ./configure --prefix=$TOOLDIR/$VERSION/$CLUSTER
    make
    make check
    make install
