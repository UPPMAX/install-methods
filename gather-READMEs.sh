#!/bin/bash

set -x
set -e

# make nonempty to skip the long finds within the module and database trees
SKIP_FIND_MODULES=
SKIP_FIND_DATABASES=

# export INSTALL_METHODS_REPOSITORY to indicate your own clone's location
REPOSITORY=${INSTALL_METHODS_REPOSITORY:-/home/douglas/github-sync/local/install-methods}


# modules

if [[ ! $SKIP_FIND_MODULES ]] ; then

    cd /sw

    find apps -name '*install-README.md' | cpio -pdm $REPOSITORY
    find libs -name '*install-README.md' | cpio -pdm $REPOSITORY
    find comp -name '*install-README.md' | cpio -pdm $REPOSITORY

fi


# databases from /sw/data/uppnex

DATA_UPPNEX_REPOSITORY="$REPOSITORY/data_uppnex"

mkdir -p $DATA_UPPNEX_REPOSITORY

if [[ ! $SKIP_FIND_DATABASES ]] ; then

    cd /sw/data/uppnex

    find ExAC -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    find Pfam -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    find cdd -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    find dbCAN -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    find annovar -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    find Chromium -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    ###  The following should eventually get brought in as well
    # find dbSNP -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find SGDP -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find blast_databases -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find chembl -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find igenomes -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find piper_references -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find pph2-db -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find reference -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find silva -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
    # find vep -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY

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

# These databases are in /sw/data/uppnex and update via crontab with an update
# script.  Update the repository copy of their READMEs, scripts and other
# files.

cd $DATA_UPPNEX_REPOSITORY
data_update  /sw/data/uppnex/Kraken             Kraken-db-README.md   Kraken-update-db.sh    
data_update  /sw/data/uppnex/diamond_databases  diamond-db-README.md  diamond-update-dbs.sh  diamond-check-dbs.sh
data_update  /sw/data/uppnex/RTG                RTG-db-README.md      RTG-update-dbs.sh      
data_update  /sw/data/uppnex/blast_scripts      README.md README-uniprot.md update_blastdb.sh update_blastdb-uniprot.sh uniprot.mk install_blastdb.sh cron-wrapper.sh crontab.txt test/test_blastdb.sh test/prots.fa test/nucls.fa test/*.out


# Databases in other locations

DATA_OTHER_REPOSITORY="$REPOSITORY/data_other"

# The BUSCO lineage sets are under the BUSCO module tree and update via crontab
# with an update script.  Fetch a copy of their READMEs and the scripts.

cd $DATA_OTHER_REPOSITORY
data_update  /sw/apps/bioinfo/BUSCO  BUSCO-db-README.md v1_lineage_sets/BUSCO-update-v1-lineage-sets.sh v2_lineage_sets/BUSCO-update-v2-lineage-sets.sh 

