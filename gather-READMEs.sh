#!/bin/bash

if [[ "$1" == "-h" ]] ; then
    cat << _usage_
Make some variables nonempty on the command line to skip the finds within the module and database trees, for example
    SKIP_FIND=yes ./gather-READMEs.sh
to skip both find commands, or
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

FIND_OPTS="-maxdepth 4"

# modules

if [[ ! $SKIP_FIND_MODULES ]] ; then

    cd /sw

    find apps      ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &
    find bioinfo   ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &
    find build     ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &
    find comp      ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &
    find libs      ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &
    find parallel  ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $REPOSITORY &

    wait

fi


# databases from /sw/data

DATA_REPOSITORY="$REPOSITORY/data"

mkdir -p $DATA_REPOSITORY

if [[ ! $SKIP_FIND_DATABASES ]] ; then

    cd /sw/data

    ###  Commented-out databases should be brought in as well
    find BioBakery_data     ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find Chromium           ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find Centrifuge-indices ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find ExAC                -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find Pfam                -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find SGDP                -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find WPS-geog            -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find annovar_data        -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find cdd                 -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find dbCAN               -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find eggNOG_data         -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find gnomad_data         -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find iGenomes            -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find krakenuniqDB        -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find panther             -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find silva               -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find KGP                 -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find MMseqs2_data        -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find alphafold_dataset   -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    find FAVOR_data          -maxdepth 2 -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find dbSNP ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find chembl ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find piper_references ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find pph2-db ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find reference ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
    # find vep ${FIND_OPTS} -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY

fi


# Custom database updates: first arg is source/destination directory, remaining
# args are files to gather; subdirectory structure is preserved

function data_update() {
    local REMOTEDIR=${1}; local LOCALDIR=${1##*/}; shift
    local CURDIR=${PWD}
    mkdir -p ${LOCALDIR}; cd ${LOCALDIR}; LOCALDIR=${PWD}
    cd ${REMOTEDIR}
    files=("$@")
    rsync -Pa --relative ${files[@]} ${LOCALDIR}/
    cd ${CURDIR}
}

# These databases are in /sw/data and update via crontab with an update
# script, OR these are additional scripts harvested from databases examined above.
# Update the repository copy of their READMEs if necessary, scripts and other
# files.

cd $DATA_REPOSITORY

data_update  /sw/data/iGenomes           tools/aws-iGenomes-download-all.sh  tools/build-iGenomes-additions.sh  tools/iGenomes-STAR-2.7.x-index.sh  tools/iGenomes-genes.bed.sh  tools/gtf2bed.pl  # additional files, README harvested above

data_update  /sw/data/SGDP               check_md5s.pl   # additional script, README harvested above
data_update  /sw/data/Kraken_data        Kraken-db-README.md    Kraken-update-db.sh    
data_update  /sw/data/Kraken2_data       Kraken2-db-README.md   Kraken2-update-db.sh    Kraken2-update-nt.sh    Kraken2-update-prebuilt.sh
data_update  /sw/data/RTG                RTG-db-README.md       RTG-update-dbs.sh      
data_update  /sw/data/diamond_databases  diamond-db-README.md   diamond-update-dbs.sh   diamond-check-dbs.sh
data_update  /sw/data/FAVOR_data         FAVOR_fetch.py         FAVOR_api_token.py

data_update  /sw/data/blast_scripts      README.md README-uniprot.md update_blastdb.sh update_blastdb-uniprot.sh uniprot.mk install_check_prepdb_blastdb.sh remove_old_blastdb.sh cron-wrapper.sh crontab.txt test/test_blastdb.sh test/prots.fa test/nucls.fa test/*.out webpage.mk webpage.md webpage.html fixup

data_update  /sw/data/ncbi_taxonomy      ncbi_taxonomy-db-README.md ncbi_taxonomy-update-dbs.sh crontab.txt webpage.html webpage.md webpage.mk

# These databases are in /sw/data and DO NOT update via crontab.
# Update the repository copy of their READMEs, scripts and other files.

cd $DATA_REPOSITORY

data_update  /sw/data/CTAT_RESOURCE_LIB  CTAT_RESOURCE_LIB-db-README.md  CTAT_RESOURCE_LIB-download-db.sh

# This might get moved to crontab later. The prebuilt databases are updated on
# a haphazard basis

data_update  /sw/data/KrakenUniq_data    KrakenUniq_data-latest_install-README.md   KrakenUniq_data-update-custom-db.sh  KrakenUniq_data-update-custom-db_veryfat.sh  KrakenUniq_data-update-standard-db.sh

# additional resources for the KGP data, in particular: lftp scripts and MD5
# checksum files. The *install-README.md files are gathered already above.

data_update  /sw/data/KGP                1000G_2504_high_coverage.lftp    1000G_2504_high_coverage.md5
data_update  /sw/data/KGP                1000_genomes_project.lftp        1000_genomes_project.md5
data_update  /sw/data/KGP                                                 central.md5
data_update  /sw/data/KGP                                                 impute_haplotypes.md5
data_update  /sw/data/KGP                                                 regional.md5

# Databases in other locations

DATA_OTHER_REPOSITORY="$REPOSITORY/data_other"

# The BUSCO lineage sets are under the BUSCO module tree and update via crontab
# with an update script.  Fetch a copy of their READMEs and the scripts.

cd $DATA_OTHER_REPOSITORY

data_update  /sw/bioinfo/BUSCO  BUSCO-db-README.md v1_lineage_sets/BUSCO-update-v1-lineage-sets.sh v2_lineage_sets/BUSCO-update-v2-lineage-sets.sh v4_lineage_sets/BUSCO-update-v4-lineage-sets.sh v5_lineage_sets/BUSCO-update-v5-lineage-sets.sh 

data_update  /sw/bioinfo/snpEff snpEff_custom_database_install-README.md
