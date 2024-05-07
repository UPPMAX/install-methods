GTDB/R214.1
===========

<https://ecogenomics.github.io/GTDBTk/index.html>

Used under license:



Structure creating script (makeroom_GTDB_R214.1.sh) moved to /sw/data/GTDB/makeroom_R214.1.sh


LOG
---

No md5sum available from their webpage.

    cd /sw/data/GTDB
    makeroom.sh -t "GTDB" -v "R214.1" -w "https://ecogenomics.github.io/GTDBTk/index.html" -c "data" -f
    ./makeroom_GTDB_R214.1.sh 
    source /sw/data/GTDB/SOURCEME_GTDB_R214.1 && cd $SRCDIR
    wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release214/214.1/auxillary_files/gtdbtk_r214_data.tar.gz

This takes a long time to download.

    tar xf gtdbtk_r214_data.tar.gz 
    mv release214 $PREFIX/
    cd $PREFIX

Now to update GTDB-Tk
