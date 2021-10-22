annovar_data/2021.05.08
=======================

Data for ANNOVAR variant annotation tool

LOG
---

    DATA=annovar_data
    DATAVERSION=2021.05.18
    TOOL=annovar
    TOOLVERSION=2020.06.08
    cd /sw/data/$DATA/$DATAVERSION

    ml bioinfo-tools
    ml $TOOL/$TOOLVERSION

Download for various genome builds.  Use our custom fetch_dbs.pl script that uses the avdblist.txt file downloaded for each build.


    ./fetch_dbs.pl hg18 humandb/hg18_avdblist.txt | bash
    ./fetch_dbs.pl hg19 humandb/hg19_avdblist.txt | bash
    ./fetch_dbs.pl hg38 humandb/hg38_avdblist.txt | bash

