cdd/3.20
========

<https://ftp.ncbi.nih.gov/pub/mmdb/cdd/>

Used under license:
Public domain

Structure creating script (makeroom_cdd_3.20.sh) moved to /sw/data/cdd/makeroom_3.20.sh

Latest version deteremined from the existence of "bitscore_specific_3.20.txt" within the directory, and the contents of cdd.info:

    cdd version 3.20
    59693 models in the default search set and indexed in Entrez
    19178 models from Pfam v34
    4871 models from COG v1
    1009 models from SMART v6.0
    10140 models from the Entrez protein clusters database
    4488 models from the TIGRFAM v14.0 database
    1125 models from the NCBIFAM database
    18882 models curated by NCBI/CDD
    4541 multi-model superfamilies indexed in Entrez


LOG
---

    makeroom.sh "-f" "-t" "cdd" "-v" "3.20" "-c" "data" "-w" "https://ftp.ncbi.nih.gov/pub/mmdb/cdd/" "-d" "Collections of position-specific scoring matrices (PSSMs) that have been created for the CD-Search service (http://www.ncbi.nlm.nih.gov/Structure/cdd/wrpsb.cgi). CD-Search can be used to identify conserved domains in a query protein sequence and infer its putative function (see: http://www.ncbi.nlm.nih.gov/Structure/cdd/cdd.shtml)." "-l" "Public domain" "-k" "protein,search,conserved,domain"
    ./makeroom_cdd_3.20.sh
    source /sw/data/cdd/SOURCEME_cdd_3.20
    cd $PREFIX
    echo "mirror ." | lftp ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/

    cd $TOOLDIR
    fixup .

Make sure mf file defines CDD_ROOT.
