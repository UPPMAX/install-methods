ChEMBL/33
========================

<https://www.ebi.ac.uk/chembl/>

The DOI for citing this ChEMBL version is <https://doi.org/10.6019/CHEMBL.database.33>

Used under license:
Creative Commons Attribution-ShareAlike 3.0 Unported license
<https://creativecommons.org/licenses/by-sa/3.0/>

Structure creating script (makeroom_ChEMBL_33.sh) moved to /sw/data/ChEMBL/makeroom_33.sh


We will download everything here <https://chembl.gitbook.io/chembl-interface-documentation/downloads>

Database   | Version | URL
-----------|---------|----
ChEMBLdb   | 33      | <https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/>
SureChEMBL | Q4 2022 | <https://ftp.ebi.ac.uk/pub/databases/chembl/SureChEMBL/data/>
UniChem    | weekly  | <https://ftp.ebi.ac.uk/pub/databases/chembl/UniChem/>
ChEMBL-RDF | 33.0    | <https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBL-RDF/latest/>


SureChEMBL contains incremental updates.


LOG
---

    makeroom.sh "-f" "-c" "data" "-t" "ChEMBL" "-v" "33" "-w" "https://www.ebi.ac.uk/chembl/" "-l" "Creative Commons Attribution-ShareAlike 3.0 Unported license" "-L" "https://creativecommons.org/licenses/by-sa/3.0/" "-d" "ChEMBL is a manually curated database of bioactive molecules with drug-like properties. It brings together chemical, bioactivity and genomic data to aid the translation of genomic information into effective new drugs."
    ./makeroom_ChEMBL_33.sh

    source /sw/data/ChEMBL/SOURCEME_ChEMBL_33

    cd $SRCDIR

    # mirror chembl_33
    CHEMBLDB_URL=https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/

    # mirror SureChEMBL
    SURECHEMBL_URL=https://ftp.ebi.ac.uk/pub/databases/chembl/

    # mirror UniChem
    UNICHEM_URL=https://ftp.ebi.ac.uk/pub/databases/chembl/

    # mirror 33.0
    CHEMBL_RDF_URL=https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBL-RDF/


    cd $SRCDIR

    mkdir CHEMBLDB
    cd CHEMBLDB
    echo "mirror --continue chembl_33" | lftp $CHEMBLDB_URL
    cd ..

    echo "mirror --continue SureChEMBL" | lftp $SURECHEMBL_URL

    echo "mirror --continue UniChem" | lftp $UNICHEM_URL

    mkdir CHEMBL_RDF
    cd CHEMBL_RDF
    echo "mirror --continue 33.0" | lftp $CHEMBL_RDF_URL
    cd ..

    mv * $PREFIX/

