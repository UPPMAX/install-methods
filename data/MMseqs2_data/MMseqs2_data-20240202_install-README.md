MMseqs2_data/20240202
=====================

<https://github.com/soedinglab/mmseqs2/wiki#downloading-databases>

Used under license:



Structure creating script (makeroom_MMseqs2_data_20240202.sh) moved to /sw/data/MMseqs2_data/makeroom_20240202.sh

LOG
---

    makeroom.sh "-f" "-t" "MMseqs2_data" "-v" "20240202" "-c" "data" "-w" "https://github.com/soedinglab/mmseqs2/wiki#downloading-databases" "-d" "Databases downloaded with MMseqs2"
    ./makeroom_MMseqs2_data_20240202.sh
    source /sw/data/MMseqs2_data/SOURCEME_MMseqs2_data_20240202
    cd $SRCDIR


    module load bioinfo-tools
    module load MMseqs2/15-6f452

Get it staarted with one smallish database.  This can run on any node.  This is handled by the script

    sbatch MMseqs2_data-smallDBs-thin.sh

This is doing, more or less:

    for DB in Pfam-B ; do
        mmseqs databases "$DB" "$PREFIX/${DB//\//_}" $SNIC_TMP
    done

Now the rest.  This needs a mem512GB node. This is handled by the script

    sbatch MMseqs2_data-largeDBs-mem512GB.sh

This is doing, more or less,

    for DB in GTDB $(mmseqs databases --tsv | cut -f1) ; do
        mmseqs databases "$DB" "$PREFIX/${DB//\//_}" $SNIC_TMP
    done

Note the filling in of GTDB and Pfam-B, don't know why these two weren't downloaded before.

Set a 'latest' symlink for the module version.

Set the table in the mf file using `mmseqs databases --tsv`.
