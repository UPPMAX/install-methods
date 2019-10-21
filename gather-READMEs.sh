#!/bin/bash

if [[ "$1" == "-h" ]] ; then
    cat << _usage_
Make some variables nonempty on the command line to skip the long finds within the module and database trees, for example
    SKIP_FIND=yes ./gather-READMEs.sh
to skip both long find commands, or
    SKIP_FIND_MODULES=yes ./gather-READMEs.sh
    SKIP_FIND_DATABASES=yes ./gather-READMEs.sh
to skip a specific one
_usage_
    exit 1
fi

set -x
set -e

SKIP_FIND_MODULES=${SKIP_FIND_MODULES-$SKIP_FIND}
SKIP_FIND_DATABASES=${SKIP_FIND_DATABASES-$SKIP_FIND}

# export INSTALL_METHODS_REPOSITORY to indicate your own clone's location
REPOSITORY=${INSTALL_METHODS_REPOSITORY:-/home/douglas/github-sync/local/install-methods}


# modules

if [[ ! $SKIP_FIND_MODULES ]] ; then

    cd /sw

    find apps -name '*install-README.md' | cpio -pdm $REPOSITORY
    find bioinfo -name '*install-README.md' | cpio -pdm $REPOSITORY
    find libs -name '*install-README.md' | cpio -pdm $REPOSITORY
    find comp -name '*install-README.md' | cpio -pdm $REPOSITORY

fi


# databases from /sw/data

DATA_REPOSITORY="$REPOSITORY/data"

mkdir -p $DATA_REPOSITORY

if [[ ! $SKIP_FIND_DATABASES ]] ; then

    cd /sw/data

    find Chromium -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find Centrifuge-indices -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find ExAC -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find Pfam -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find cdd -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find dbCAN -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find annovar -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find panther -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find eggNOG -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find igenomes -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find silva -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    ###  The following should eventually get brought in as well
    # find dbSNP -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find SGDP -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find blast_databases -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find chembl -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find piper_references -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find pph2-db -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find reference -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find vep -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY

fi


# Custom database updates: first arg is source/destination directory, remaining
# args are files to gather; subdirectory structure is preserved

function data_update() {
    REMOTEDIR=${1}; LOCALDIR=${1##*/}; shift
    CURDIR=${PWD}
    mkdir -p ${LOCALDIR}; cd ${LOCALDIR}; LOCALDIR=${PWD}
    cd ${REMOTEDIR}
    files=("$@")
    rsync -Pa --relative ${files[@]} ${LOCALDIR}/
    cd ${CURDIR}
}

# These databases are in /sw/data and update via crontab with an update
# script.  Update the repository copy of their READMEs, scripts and other
# files.

cd $DATA_REPOSITORY
data_update  /sw/data/Kraken             Kraken-db-README.md   Kraken-update-db.sh    
data_update  /sw/data/Kraken2            Kraken2-db-README.md   Kraken2-update-db.sh    Kraken2-update-nt.sh
data_update  /sw/data/diamond_databases  diamond-db-README.md  diamond-update-dbs.sh  diamond-check-dbs.sh
data_update  /sw/data/RTG                RTG-db-README.md      RTG-update-dbs.sh      
data_update  /sw/data/blast_scripts      README.md README-uniprot.md update_blastdb.sh update_blastdb-uniprot.sh uniprot.mk install_blastdb.sh remove_old_blastdb.sh cron-wrapper.sh crontab.txt test/test_blastdb.sh test/prots.fa test/nucls.fa test/*.out webpage.mk webpage.md webpage.html
data_update  /sw/data/ncbi_taxonomy      ncbi_taxonomy-db-README.md ncbi_taxonomy-update-dbs.sh crontab.txt webpage.html webpage.md webpage.mk

# These databases are in /sw/data and DO NOT update via crontab.
# Update the repository copy of their READMEs, scripts and other files.

cd $DATA_REPOSITORY
data_update  /sw/data/CTAT_RESOURCE_LIB  CTAT_RESOURCE_LIB-db-README.md  CTAT_RESOURCE_LIB-download-db.sh


# Databases in other locations

DATA_OTHER_REPOSITORY="$REPOSITORY/data_other"

# The BUSCO lineage sets are under the BUSCO module tree and update via crontab
# with an update script.  Fetch a copy of their READMEs and the scripts.

cd $DATA_OTHER_REPOSITORY
data_update  /sw/bioinfo/BUSCO  BUSCO-db-README.md v1_lineage_sets/BUSCO-update-v1-lineage-sets.sh v2_lineage_sets/BUSCO-update-v2-lineage-sets.sh 

