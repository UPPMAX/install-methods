KrakenUniq_data/latest
======================

<https://github.com/fbreitwieser/KrakenUniq>

Used under license:
GPLv3, MIT


Structure creating script (makeroom_KrakenUniq_data_latest.sh) moved to /sw/data/KrakenUniq_data/makeroom_latest.sh

LOG
---

    makeroom.sh "-f" "-t" "KrakenUniq_data" "-v" "latest" "-c" "data" "-w" "https://github.com/fbreitwieser/KrakenUniq" "-l" "GPLv3, MIT" "-d" "Latest database build for KrakenUniq"
    ./makeroom_KrakenUniq_data_latest.sh

Submit a job to build the latest `--standard` database for ourselves.

    source /sw/data/KrakenUniq_data/SOURCEME_KrakenUniq_data_latest
    cd $TOOLDIR
    sbatch KrakenUniq_data-update-db.sh

Install pre-built databases from <https://benlangmead.github.io/aws-indexes/k2>.  The dates/names are as of 2022-10-04.

    cd $TOOLDIR
    mkdir -p prebuilt
    cd prebuilt

    mkdir krakendb-2022-06-16-STANDARD
    cd krakendb-2022-06-16-STANDARD
    for F in https://genome-idx.s3.amazonaws.com/kraken/uniq/krakendb-2022-06-16-STANDARD/database.kdb https://genome-idx.s3.amazonaws.com/kraken/uniq/krakendb-2022-06-16-STANDARD/kuniq_standard_minus_kdb.20220616.tgz ; do wget "$F"; done
    tar xf kuniq_standard_minus_kdb.20220616.tgz 
    cd ..

    mkdir krakendb-2020-08-16-all_pluseupath
    cd krakendb-2020-08-16-all_pluseupath/
    for F in https://genome-idx.s3.amazonaws.com/kraken/uniq/krakendb-2020-08-16-all_pluseupath/database.kdb https://genome-idx.s3.amazonaws.com/kraken/uniq/krakendb-2020-08-16-all_pluseupath/kuniq_standard_plus_eupath_minus.kdb.20200816.tgz   ; do wget "$F"; done
    tar tf kuniq_standard_plus_eupath_minus.kdb.20200816.tgz 
    cd ..

Also update mf file to reflect the presence of the prebuilt databases.


**2023-01-23:** No updates to pre-built databases

