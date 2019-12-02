#!/bin/bash

ROOT=/sw/data/ncbi_taxonomy

WGET_OPTIONS="--quiet --timestamping"

VERBOSE=
MOVE_TO_FINAL=yes

# Much of the guts come from diamond-db-update.sh, but this is much simplified
# by moving the temp directory and latest symlink to be done once in the script

DateFormat='%Y%m%d-%H%M%S'  # used for databases where the version tag is a date
TODAY=`date +"$DateFormat"`
NEWVERSION="$TODAY"

echo "Updating NCBI taxonomy files to version $NEWVERSION"

# This will set NEWVERSION based on the last-modified time of a file, but we
# don't do that for these databases because they are all bundled under the date
# the whole set was updated
#
# [[ "$DateSource" = 'now' ]] && NEWVERSION="$TODAY" || NEWVERSION=`date --date=@$(stat -c'%Y' $DB_FILE) +"$DateFormat"`

#set -x

function error_send_email() {
    local MSG="Error within $0: '$1'"
    echo -e "$MSG"
	mailx -s "$0 error: '$1'" lars.eklund@uppmax.uu.se <<< $MSG
    exit 1
}

function warning_send_email() {
    local MSG="Warning within $0: '$1'"
    echo -e "$MSG"
	mailx -s "$0 warning: '$1'" lars.eklund@uppmax.uu.se <<< $MSG
}

cd $ROOT
[[ -L latest ]] && PREVIOUSVERSION=$(readlink latest) || PREVIOUSVERSION=
[[ (! "$PREVIOUSVERSION" || "$PREVIOUSVERSION" != "$NEWVERSION") || ! $MOVE_TO_FINAL ]] || error_send_email "latest already points to $NEWVERSION"

TMPDIR=tmp.$$.$TODAY
mkdir $TMPDIR || error_send_email "error during mkdir $TMPDIR"
[[ $MOVE_TO_FINAL ]] || echo "... but not actually finalising the update, leaving files in the tmp directory $ROOT/$TMPDIR"

function make_latest_symlink() {
    local NEWVERSION=$1
    local HERE=$PWD
    cd $ROOT
    { rm -f latest && ln -sf $NEWVERSION latest; } || error_send_email "could not create 'latest' symlink"
    cd $HERE
}

[[ $(uname -n) = 'rackham5.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on rackham5"


# unpack a single gzipped database file
function unpack_db_single() {
    local DB_INPUT=$1
    local METHOD=${2:?METHOD required}
    local FUNC="$0: unpack_db_single"
    local cmd=
    case $METHOD in
        tar)  cmd="tar xzf $DB_INPUT" ;;
        zcat) cmd="zcat $DB_INPUT > ${DB_INPUT%.gz}" ;;
        none) cmd="echo $DB_INPUT" ;;
    esac 
    [[ $VERBOSE ]] && echo "$FUNC:$PWD:$cmd"
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
    local DB_MD5_FILE=$4  # 4  md5 checksum filename, md5sum --quiet -c with this checks $DB_FILE
    local METHOD=$5       # 5  method to unpack, 'tar' or 'zcat'
    local FUNC="get_db_single"

    [[ $VERBOSE ]] || echo "$DB_DIR/$DB_FILE ..."

    cd $ROOT
    cd $TMPDIR
    mkdir -p $DB_DIR
    cd $DB_DIR

    if wget $WGET_OPTIONS $URL_DIR/$DB_MD5_FILE ; then  # fetch the md5 file, preserving its server time
        if wget $WGET_OPTIONS $URL_DIR/$DB_FILE ; then  # fetch the database file
            if md5sum --quiet -c $DB_MD5_FILE ; then  # it looks good, update to this version
                [[ $VERBOSE ]] && echo -e "\n$FUNC: successfully downloaded update for $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
                unpack_db_single  $DB_FILE  $METHOD
                mkdir -p download && mv -f $DB_FILE $DB_MD5_FILE download/ || error_send_email "could not move files to download/"
                [[ $VERBOSE ]] && echo -e "\n$FUNC: successfully updated $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
            else 
                error_send_email "$FUNC: $DB_FILE md5 checksum do not match"
            fi
            cd $ROOT
        else 
            warning_send_email "$FUNC: $DB_FILE could not be fetched"
        fi
    else 
        warning_send_email "$FUNC: $URL_DIR/$DB_MD5_FILE could not be fetched, so not fetching $URL_DIR/$DB_FILE"
    fi
}

# get_db_SIMPLE()
#
# Download updates for a database that is a single file with no md5

function get_db_SIMPLE() {

    local DB_DIR=$1       # 1  base directory, . for current directory
    local URL_DIR=$2      # 2  base url/directory for wget
    local DB_FILE=$3      # 3  data filename
    local FUNC="get_db_SIMPLE"

    [[ $VERBOSE ]] || echo "$DB_DIR/$DB_FILE ..."

    cd $ROOT
    cd $TMPDIR
    mkdir -p $DB_DIR
    cd $DB_DIR
    wget $WGET_OPTIONS $URL_DIR/$DB_FILE
    [[ $VERBOSE ]] && echo -e "\n$FUNC: successfully downloaded update for $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
    mkdir -p download && cp -af $DB_FILE download/ || { echo "could not move files to download/"; exit 1; }
    [[ $VERBOSE ]] && echo -e "\n$FUNC: successfully updated $DB_FILE to $ROOT/$TMPDIR/$NEWVERSION\n"
    cd $ROOT
}



# set -x

# taxonomy database

get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxdump.tar.gz             taxdump.tar.gz.md5             tar
get_db_SIMPLE  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxdump_readme.txt
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxcat.tar.gz              taxcat.tar.gz.md5              tar
get_db_SIMPLE  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  taxcat_readme.txt

# new_taxdump database

get_db_single  new_taxdump ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump  new_taxdump.tar.gz         new_taxdump.tar.gz.md5             tar
get_db_SIMPLE  new_taxdump ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump  taxdump_readme.txt

# gi_taxid for deprecated GIs

get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_nucl.dmp.gz       gi_taxid_nucl.dmp.gz.md5       zcat
get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_prot.dmp.gz       gi_taxid_prot.dmp.gz.md5       zcat
#get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_nucl_diff.dmp.gz  gi_taxid_nucl_diff.dmp.gz.md5  zcat # no longer available
#get_db_single  . ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy  gi_taxid_prot_diff.dmp.gz  gi_taxid_prot_diff.dmp.gz.md5  zcat # no longer available

# accession2taxid for new accession numbers

get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_gb.accession2taxid.gz    nucl_gb.accession2taxid.gz.md5    zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_wgs.accession2taxid.gz   nucl_wgs.accession2taxid.gz.md5   zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  prot.accession2taxid.gz       prot.accession2taxid.gz.md5       zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  pdb.accession2taxid.gz        pdb.accession2taxid.gz.md5        zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_nucl.accession2taxid.gz  dead_nucl.accession2taxid.gz.md5  zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_prot.accession2taxid.gz  dead_prot.accession2taxid.gz.md5  zcat
get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  dead_wgs.accession2taxid.gz   dead_wgs.accession2taxid.gz.md5   zcat
#get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_est.accession2taxid.gz   nucl_est.accession2taxid.gz.md5   zcat # no longer available
#get_db_single  accession2taxid  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid  nucl_gss.accession2taxid.gz   nucl_gss.accession2taxid.gz.md5   zcat # no longer available

# collections information

get_db_SIMPLE  .                ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy                  coll_dump.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Collection_codes.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Institution_codes.txt
get_db_SIMPLE  biocollections   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections   Unique_institution_codes.txt

# remove previous version, place update, and update latest symlink
[[ $MOVE_TO_FINAL ]] && { echo "Final move to $ROOT/$NEWVERSION ..."; } || { echo "No final move, downloaded versions left in $ROOT/$TMPDIR"; exit 0; }

cd $ROOT
[[ -d $PREVIOUSVERSION ]] && rm -rf $PREVIOUSVERSION
mv $TMPDIR $NEWVERSION
make_latest_symlink  "$NEWVERSION"

chgrp -hR sw .
chmod -R u+rwX,g+rwX,o+rX .
find . -type d -exec chmod g+s {} \;
echo "Done."

