MMseqs2_data/20230125
========================

<https://github.com/soedinglab/mmseqs2/wiki#downloading-databases>

Used under license:



Structure creating script (makeroom_MMseqs2_data_20230125.sh) moved to /sw/data/MMseqs2_data/makeroom_20230125.sh

LOG
---

    makeroom.sh "-f" "-t" "MMseqs2_data" "-v" "20230125" "-c" "data" "-w" "https://github.com/soedinglab/mmseqs2/wiki#downloading-databases" "-d" "Databases downloaded with MMseqs2"
    ./makeroom_MMseqs2_data_20230125.sh
    source /sw/data/MMseqs2_data/SOURCEME_MMseqs2_data_20230125
    cd $SRCDIR


    module load bioinfo-tools
    module load MMseqs2/14-7e284

    for DB in $(mmseqs databases --tsv | cut -f1) ; do
        mmseqs databases "$DB" "$PREFIX/${DB//\//_}" $SNIC_TMP
    done

Filling in a couple of gaps, don't know why these two weren't downloaded before.

    for DB in GTDB  Pfam-B; do
        mmseqs databases "$DB" "$PREFIX/${DB//\//_}" $SNIC_TMP
    done

Set a 'latest' symlink for the module version.

Set the table in the mf file using `mmseqs databases --tsv`.
