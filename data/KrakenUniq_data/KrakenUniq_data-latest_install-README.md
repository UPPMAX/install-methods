KrakenUniq_data/latest
======================

<https://github.com/fbreitwieser/KrakenUniq>

Used under license:
GPLv3, MIT

Pre-built databases
-------------------

**Maybe an update, 2024-04-08 ??**

A microbial database is available.

Pre-built databases are installed from from
<https://benlangmead.github.io/aws-indexes/k2>.  The dates/names are as of
2022-10-04.


Structure creating script (makeroom_KrakenUniq_data_latest.sh) moved to /sw/data/KrakenUniq_data/makeroom_latest.sh

LOG
---

    makeroom.sh "-f" "-t" "KrakenUniq_data" "-v" "latest" "-c" "data" "-w" "https://github.com/fbreitwieser/KrakenUniq" "-l" "GPLv3, MIT" "-d" "Latest database build for KrakenUniq"
    ./makeroom_KrakenUniq_data_latest.sh

Submit a job to build the latest `--standard` database for ourselves.

    source /sw/data/KrakenUniq_data/SOURCEME_KrakenUniq_data_latest
    cd $TOOLDIR
    sbatch KrakenUniq_data-update-db.sh

Install pre-built databases from <https://benlangmead.github.io/aws-indexes/k2>.  The dates/names are as of 2024-04-08.

    cd $TOOLDIR
    mkdir -p prebuilt
    cd prebuilt

    BASEURL="https://genome-idx.s3.amazonaws.com/kraken/uniq"

    DBNAME=krakendb-2022-06-16-STANDARD
    cd $TOOLDIR
    mkdir -p prebuilt
    cd prebuilt
    mkdir $DBNAME
    cd $DBNAME/
    for F in database.kdb kuniq_standard_minus_kdb.20220616.tgz ; do
        url="$BASEURL/$DBNAME/$F"
        wget "$url"
    done
    tar xf kuniq_standard_minus_kdb.20220616.tgz 

    DBNAME=krakendb-2023-08-08-MICROBIAL
    cd $TOOLDIR
    mkdir -p prebuilt
    cd prebuilt
    mkdir $DBNAME
    cd $DBNAME/
    for F in database.kdb kuniq_microbialdb_minus_kdb.20230808.tgz ; do
        url="$BASEURL/$DBNAME/$F"
        wget "$url"
    done
    tar xf kuniq_microbialdb_minus_kdb.20230808.tgz

    ###
    ### no longer available
    ###
    ### DBNAME=krakendb-2020-08-16-all_pluseupath
    ### cd $TOOLDIR
    ### mkdir -p prebuilt
    ### cd prebuilt
    ### mkdir $DBNAME
    ### cd $DBNAME/
    ### for F in database.kdb kuniq_standard_plus_eupath_minus.kdb.20200816.tgz ; do
    ###     url="$BASEURL/$DBNAME/$F"
    ###     wget "$url"
    ### done
    ### tar xf kuniq_standard_plus_eupath_minus.kdb.20200816.tgz 


Also update mf file to reflect the presence of the prebuilt databases.


**2024-04-08:** Update added microbial database and removed 2020-08-16 all_pluseupath

