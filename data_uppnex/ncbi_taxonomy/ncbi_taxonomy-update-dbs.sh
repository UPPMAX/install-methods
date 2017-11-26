#!/bin/bash

ROOT=/sw/data/uppnex/ncbi_taxonomy

WGET_OPTIONS="--quiet --timestamping"

# Much of the guts come from diamond-db-update.sh, but this is much simplified
# by moving the temp directory and latest symlink to be done once in the script
# script

DateFormat='%Y%m%d'  # used for databases where the version tag is a date
TODAY=`date +"$DateFormat"`
NEWVERSION="$TODAY"

# This will set NEWVERSION based on the last-modified time of a file, but we
# don't do that for these databases because they are all bundled under the date
# the whole set was updated
#
# [[ "$DateSource" = 'now' ]] && NEWVERSION="$TODAY" || NEWVERSION=`date --date=@$(stat -c'%Y' $DB_FILE) +"$DateFormat"`

set -x

cd $ROOT
[[ -L latest ]] && PREVIOUSVERSION=$(readlink latest) || PREVIOUSVERSION=
[[ ! "$PREVIOUSVERSION" || "$PREVIOUSVERSION" != "$NEWVERSION" ]] || { echo "latest already points to $NEWVERSION, exiting..."; exit 1; }

TMPDIR=tmp.$$.$TODAY
mkdir $TMPDIR || { echo "$FUNC: $DB_FILE, temp directory $TMPDIR, error during mkdir"; exit 1; }

function error_send_email() {
    local MSG="Error within $0: '$1'"
	mailx -s "$0 error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
    exit 1
}

function make_latest_symlink() {
    local NEWVERSION=$1
    local HERE=$PWD
    cd $ROOT
    { rm -f latest && ln -sf $NEWVERSION latest; } || { echo "could not create 'latest' symlink"; exit 1; }
    cd $HERE
}

[[ $(uname -n) = 'milou-b.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on milou-b"


# unpack a single gzipped database file
function unpack_db_single() {
    local DB_INPUT=$1
    local METHOD=${2:?METHOD required}
    local FUNC="$0: unpack_db_single"
    local cmd=
    case $METHOD in
        tar)  cmd="tar xzvf $DB_INPUT" ;;
        zcat) cmd="zcat $DB_INPUT > ${DB_INPUT%.gz}" ;;
        none) cmd="echo $DB_INPUT" ;;
    esac 
    echo
    echo "$FUNC: unpacking DB in directory $PWD with command '$cmd'"
    echo
    eval $cmd
}


# get_db_single()
#
# Download updates for a database that is a single file with separate md5
# checksum file, using wget.
#
# Version of the download is dependent on DateSource

function get_db_single() {

    local DB_DIR=$1       # 1  base directory, . for current directory
    local URL_DIR=$2      # 2  base url/directory for wget
    local DB_FILE=$3      # 3  data filename
    local DB_MD5_FILE=$4  # 4  md5 checksum filename, md5sum -c with this checks $DB_FILE
    local METHOD=$5       # 5  method to unpack, 'tar' or 'zcat'
    local FUNC="get_db_single"

    cd $ROOT
    cd $TMPDIR
    mkdir -p $DB_DIR
    cd $DB_DIR

    wget $WGET_OPTIONS $URL_DIR/$DB_MD5_FILE  # fetch the md5 file, preserving its server time
    wget $WGET_OPTIONS $URL_DIR/$DB_FILE  # fetch the database file
    if md5sum -c $DB_MD5_FILE ; then  # it looks good, update to this version
        echo -e "\n$FUNC: successfully downloaded update for $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
        unpack_db_single  $DB_FILE  $METHOD
        mkdir -p download && mv -vf $DB_FILE $DB_MD5_FILE download/ || { echo "could not move files to download/"; exit 1; }
        echo -e "\n$FUNC: successfully updated $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
    else 
        echo -e "\n\n$FUNC: md5 checksum didn't match for $DB_FILE, exiting...\n\n"
        exit 1
    fi
    cd $ROOT
}

# get_db_SIMPLE()
#
# Download updates for a database that is a single file with no md5

function get_db_SIMPLE() {

    local DB_DIR=$1       # 1  base directory, . for current directory
    local URL_DIR=$2      # 2  base url/directory for wget
    local DB_FILE=$3      # 3  data filename
    local FUNC="get_db_SIMPLE"

    cd $ROOT
    cd $TMPDIR
    mkdir -p $DB_DIR
    cd $DB_DIR
    wget $WGET_OPTIONS $URL_DIR/$DB_FILE
    echo -e "\n$FUNC: successfully downloaded update for $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
    mkdir -p download && cp -avf $DB_FILE download/ || { echo "could not move files to download/"; exit 1; }
    echo -e "\n$FUNC: successfully updated $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
    cd $ROOT
}



set -x

# taxonomy database

get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxdump.tar.gz             taxdump.tar.gz.md5             tar
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxcat.tar.gz              taxcat.tar.gz.md5              tar

# gi_taxid for deprecated GIs

get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_nucl.dmp.gz       gi_taxid_nucl.dmp.gz.md5       zcat
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_nucl_diff.dmp.gz  gi_taxid_nucl_diff.dmp.gz.md5  zcat
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_prot.dmp.gz       gi_taxid_prot.dmp.gz.md5       zcat
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_prot_diff.dmp.gz  gi_taxid_prot_diff.dmp.gz.md5  zcat

# accession2taxid for new accession numbers

get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_est.accession2taxid.gz   nucl_est.accession2taxid.gz.md5   zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_gb.accession2taxid.gz    nucl_gb.accession2taxid.gz.md5    zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_gss.accession2taxid.gz   nucl_gss.accession2taxid.gz.md5   zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_wgs.accession2taxid.gz   nucl_wgs.accession2taxid.gz.md5   zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  prot.accession2taxid.gz       prot.accession2taxid.gz.md5       zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  pdb.accession2taxid.gz        pdb.accession2taxid.gz.md5        zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_nucl.accession2taxid.gz  dead_nucl.accession2taxid.gz.md5  zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_prot.accession2taxid.gz  dead_prot.accession2taxid.gz.md5  zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_wgs.accession2taxid.gz   dead_wgs.accession2taxid.gz.md5   zcat

# collections information

get_db_SIMPLE  .                ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy                  coll_dump.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Collection_codes.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Institution_codes.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Unique_institution_codes.txt

# remove previous version, place update, and update latest symlink
cd $ROOT
[[ -d $PREVIOUSVERSION ]] && rm -rf $PREVIOUSVERSION
mv $TMPDIR $NEWVERSION
make_latest_symlink  "$NEWVERSION"

chgrp -hR sw .
chmod -R u+rwX,g+rwX,o+rX .
find . -type d -exec chmod g+s {} \;

