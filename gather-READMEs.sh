#!/bin/bash

set -x
set -e

# export INSTALL_METHODS_REPOSITORY to indicate your own clone's location
REPOSITORY=${INSTALL_METHODS_REPOSITORY:-/home/douglas/github-sync/local/install-methods}


# modules

cd /sw

find apps -name '*install-README.md' | cpio -pdm $REPOSITORY
find libs -name '*install-README.md' | cpio -pdm $REPOSITORY
find comp -name '*install-README.md' | cpio -pdm $REPOSITORY


# databases from /sw/data/uppnex

DATA_UPPNEX_REPOSITORY="$REPOSITORY/data_uppnex"

mkdir -p $DATA_UPPNEX_REPOSITORY

cd /sw/data/uppnex

find ExAC -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
find Pfam -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
find cdd -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
find dbCAN -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find SGDP -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find annotations -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find blast_databases -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find chembl -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find igenomes -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find piper_references -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find pph2-db -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find reference -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find silva -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY
# find vep -name '*install-README.md' | cpio -pdm $DATA_UPPNEX_REPOSITORY


function data_update() {
    REMOTEDIR=${1}; LOCALDIR=${1##*/}; shift
    mkdir -p ${LOCALDIR}; cd ${LOCALDIR}
    files=("$@")
    for F in ${files[@]} ; do
        REMOTEFILE=${REMOTEDIR}/${F}; LOCALFILE=.
        cp --update --preserve=timestamps -v ${REMOTEFILE} ${LOCALFILE}
    done
    cd ..
}

# These databases are in /sw/data/uppnex and update via crontab with an update
# script.  Update the repository copy of their READMEs and the scripts.

cd $DATA_UPPNEX_REPOSITORY
data_update  /sw/data/uppnex/Kraken             Kraken-db-README.md   Kraken-update-db.sh    
data_update  /sw/data/uppnex/diamond_databases  diamond-db-README.md  diamond-update-dbs.sh  diamond-check-dbs.sh
data_update  /sw/data/uppnex/RTG                RTG-db-README.md      RTG-update-dbs.sh      


# Databases in other locations

DATA_OTHER_REPOSITORY="$REPOSITORY/data_other"

# The BUSCO lineage sets are under the BUSCO module tree and update via crontab
# with an update script.  Fetch a copy of their READMEs and the scripts.

cd $DATA_OTHER_REPOSITORY
data_update  /sw/apps/bioinfo/BUSCO  BUSCO-db-README.md v1_lineage_sets/BUSCO-update-v1-lineage-sets.sh v2_lineage_sets/BUSCO-update-v2-lineage-sets.sh 

