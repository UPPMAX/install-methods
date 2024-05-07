GTDB/R202
========================

<https://ecogenomics.github.io/GTDBTk/index.html>

Used under unknown license:


Structure creating script (makeroom_GTDB_R202.sh) moved to /sw/data/GTDB/makeroom_R202.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "GTDB" -v "R202" -w "https://ecogenomics.github.io/GTDBTk/index.html" -c "data" -f
    ./makeroom_GTDB_R202.sh
    TOOL=GTDB
    version=R202
    source /sw/data/${TOOL}/SOURCEME_${TOOL}_${version}
    cd $SRCDIR
    wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release202/202.0/auxillary_files/gtdbtk_r202_data.tar.gz
    tar xfvz gtdbtk_r202_data.tar.gz -C $PREFIX

No md5sum available from their webpage.

