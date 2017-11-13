#!/bin/bash


ROOT=/sw/data/uppnex/ncbi_taxonomy

# Much of the guts come from diamond-db-update.sh

DateFormat='%Y%m%d'  # used for databases where the version tag is a date
DateSource='now'  # 'now' means use today's date as in TODAY below, otherwise means use date on downloaded md5 checksum file
TODAY=`date +"$DateFormat"`

set -x

function error_send_email() {
    local MSG="Error within $0: '$1'"
	mailx -s "$0 error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
    exit 1
}

function make_latest_symlink() {
    local FUNC=$1
    local NEWVERSION=$2
    { rm -f latest && ln -sf $NEWVERSION latest; } || { echo "$FUNC: could not create 'latest' symlink"; exit 1; }
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

    DB_DIR=$1       # 1  base directory, . for current directory
    URL_DIR=$2      # 2  base url/directory for wget
    DB_FILE=$3      # 3  data filename
    DB_MD5_FILE=$4  # 4  md5 checksum filename, md5sum -c with this checks $DB_FILE
    METHOD=$5       # 5  method to unpack, 'tar' or 'zcat'
    FUNC="$0: get_db_single"

    cd $ROOT
    mkdir -p $DB_DIR
    cd $DB_DIR
    TMPDIR=tmp.$$
    mkdir $TMPDIR || { echo "$FUNC: $DB_FILE, temp directory $TMPDIR, error during mkdir"; exit 1; }
    cd $TMPDIR
    wget --timestamping $URL_DIR/$DB_MD5_FILE  # fetch the md5 file, preserving its server time
    [[ "$DateSource" = 'now' ]] && NEWVERSION="$TODAY" || NEWVERSION=`date --date=@$(stat -c'%Y' $DB_MD5_FILE) +"$DateFormat"`
    if [[ -d ../$NEWVERSION ]] && diff -q ../$NEWVERSION/download/$DB_MD5_FILE $DB_MD5_FILE ; then
        echo
        echo
        echo "$FUNC: $DB_FILE version $NEWVERSION exists at $ROOT/$DB_DIR/$NEWVERSION"
        echo "$FUNC: md5 files are also identical, not continuing update"
        echo
        echo
        cd ..
        #ln -sf $NEWVERSION latest || { echo "$FUNC: could not refresh 'latest' symlink"; exit 1; }
        make_latest_symlink  "$FUNC"  "$NEWVERSION"
        rm -rf $TMPDIR
    else
        wget --timestamping $URL_DIR/$DB_FILE  # fetch the database file
        if md5sum -c $DB_MD5_FILE ; then  # it looks good, update to this version
            echo "$FUNC: successfully downloaded update for $DB_FILE to $ROOT/$DB_DIR/$NEWVERSION"

            unpack_db_single  $DB_FILE  $METHOD

            # database is created in current directory, need to stash downloaded files into download/
            mkdir download && mv -vf $DB_FILE $DB_MD5_FILE download/ || { echo "could not move files to download/"; exit 1; }
            cd ..
            if [[ -d $NEWVERSION ]] ; then  # a previous download created this already
                mv -vf $TMPDIR/download/* $NEWVERSION/download/
                rmdir $TMPDIR/download
                mv -vf $TMPDIR/* $NEWVERSION/
                #rsync -Pa $TMPDIR/* $NEWVERSION/
                rm -rf $TMPDIR
            else
                mv -v $TMPDIR $NEWVERSION
            fi
            #{ rm -f latest && ln -sf $NEWVERSION latest; } || { echo "$FUNC: could not create 'latest' symlink"; exit 1; }
            make_latest_symlink  "$FUNC"  "$NEWVERSION"
            echo "$FUNC: successfully updated $DB_FILE to $ROOT/$DB_DIR/$NEWVERSION"
        else 
            echo "$FUNC: md5 checksum didn't match for $DB_FILE, removing $TMPDIR"
            cd ..
            rm -rf $TMPDIR
        fi
    fi
    cd $ROOT
}

# get_db_SIMPLE()
#
# Download updates for a database that is a single file with separate md5
# checksum file, using wget.
#
# Version of the download is dependent on DateSource

function get_db_SIMPLE() {

    DB_DIR=$1       # 1  base directory, . for current directory
    URL_DIR=$2      # 2  base url/directory for wget
    DB_FILE=$3      # 3  data filename
    FUNC="$0: get_db_SIMPLE"

    cd $ROOT
    mkdir -p $DB_DIR
    cd $DB_DIR
    TMPDIR=tmp.$$
    mkdir $TMPDIR || { echo "$FUNC: $DB_FILE, temp directory $TMPDIR, error during mkdir"; exit 1; }
    cd $TMPDIR
    wget --timestamping $URL_DIR/$DB_FILE
    [[ "$DateSource" = 'now' ]] && NEWVERSION="$TODAY" || NEWVERSION=`date --date=@$(stat -c'%Y' $DB_FILE) +"$DateFormat"`
    cd ..
    mkdir $NEWVERSION
    mv -vf $TMPDIR/$DB_FILE $NEWVERSION/
    make_latest_symlink  "$FUNC"  "$NEWVERSION"
    rm -rf $TMPDIR
    cd $ROOT
}



set -x

PREVIOUSVERSION=$(readlink latest)

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

[[ "$PREVIOUSVERSION" != "$NEWVERSION" ]] && echo rm -f $PREVIOUSVERSION

cd $ROOT

chgrp -hR sw .
chmod -R u+rwX,g+rwX,o+rX .
find . -type d -exec chmod g+s {} \;

