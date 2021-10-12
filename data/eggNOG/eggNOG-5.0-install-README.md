eggNOG databases 5.0
======================

Following the info at

<https://github.com/eggnogdb/eggnog-mapper/wiki/eggNOG-mapper-v2.1.2-to-v2.1.4>


The following will download the eggNOG annotation database (along with the taxa databases), and the database of eggNOG proteins for Diamond searches.

    module load bioinfo-tools eggNOG-mapper/2.1.4
    download_eggnog_data.py  -y --data_dir /sw/data/eggNOG/5.0 


Then we downloaded all taxon-specific databases.  The command for that is

    download_eggnog_data.py -y --data_dir /sw/data/eggNOG/5.0 -H -d taxID

