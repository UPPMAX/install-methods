eggNOG_data/5.0.0
========================

<http://eggnog5.embl.de/#/app/home>

Used under license:
Public


Structure creating script (makeroom_eggNOG_data_5.0.0.sh) moved to /sw/data/eggNOG_data/makeroom_5.0.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "eggNOG_data" "-v" "5.0.0" "-c" "data" "-w" "http://eggnog5.embl.de/#/app/home" "-d" "hierarchical, functionally and phylogenetically annotated orthology resource based on 5090 organisms and 2502 viruses" "-l" "Public"
    ./makeroom_eggNOG_data_5.0.0.sh
eggNOG_data/5.0
===============

<http://eggnog5.embl.de/#/app/home>

Used under license:
Public

Not certain about the license, but it is listed as "Public" in its paper in the NRA Databases issue at <https://academic.oup.com/nar/article/47/D1/D309/5173662>

    makeroom.sh -f -t "eggNOG_data" -v "5.0" -c "data" -w "http://eggnog5.embl.de/#/app/home" -d "hierarchical, functionally and phylogenetically annotated orthology resource based on 5090 organisms and 2502 viruses" -l "Public"

    ./makeroom_eggNOG_data_5.0.sh

Adjust PREFIX so that it doesn't include the $CLUSTER as that's not needed.


LOG
---

Following the info at

<https://github.com/eggnogdb/eggnog-mapper/wiki/eggNOG-mapper-v2.1.5#Pypi_version>


The following will download the eggNOG annotation database (along with the taxa databases), and the database of eggNOG proteins for Diamond searches.

    EGGNOG_DATA_DIR=$PREFIX

    module load bioinfo-tools eggNOG-mapper/2.1.5
    download_eggnog_data.py  -y --data_dir /sw/data/eggNOG/5.0 


Then we downloaded all taxon-specific databases.  The command for that is

    download_eggnog_data.py -y --data_dir /sw/data/eggNOG/5.0 -H -d taxID

We fetch the list of available taxids from

    http://eggnog5.embl.de/#/app/downloads


eggNOG_data/5.0
========================
Structure creating script (makeroom_eggNOG_data_5.0.sh) moved to /sw/data/eggNOG_data/makeroom_5.0.sh

LOG
---

