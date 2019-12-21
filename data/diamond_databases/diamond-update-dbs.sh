#!/bin/bash 

module load bioinfo-tools
module load diamond/0.9.29
module load gnuparallel/20170122

ROOT=/sw/data/diamond_databases
THREADS=10
DateFormat='%Y%m%d-%H%M%S'  # used for databases where the version tag is date-time
DateSource='now'  # 'now' means use today's date as in TODAY below, otherwise means use date on downloaded md5 checksum file
TODAY=`date +"$DateFormat"`
TAXONMAP=/sw/data/ncbi_taxonomy/latest/accession2taxid/download/prot.accession2taxid.gz
TAXONNODES=/sw/data/ncbi_taxonomy/latest/nodes.dmp
WGET_OPTIONS="--quiet --timestamping"

echo "$0: building databases with $(diamond version)"

#set -x

# TODO: for get_db_single(), when checking for previous download, we should compare md5 against previous md5s, if they exist
# TODO: for uniref90, extract md5 sum from xml and check against it

function error_send_email() {
    MSG="Error within $0: '$1'"
	mailx -s "$0 error: '$1'" lars.eklund@uppmax.uu.se <<< $MSG
    exit 1
}

function make_latest_symlink() {
    FUNC=$1
    NEWVERSION=$2
    { rm -f latest && ln -sf $NEWVERSION latest; } || { echo "$FUNC: could not create 'latest' symlink"; exit 1; }
}

[[ $(uname -n) = 'rackham5.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on rackham5"

set -e


# create diamond DB from a single file
function create_diamond_db_single() {
    DB_OUTPUT=$1
    DB_INPUT=$2
    shift;shift
    EXTRA_ARGS="$@" #This allows for passing any new or future ofoptins when creating the db if no args given none are set.
    FUNC="create_diamond_db_single"
    FAA_FILE=${DB_OUTPUT}.faa
    zcat $DB_INPUT > $FAA_FILE
    cmd="/usr/bin/time -v diamond makedb --in $FAA_FILE --threads $THREADS -d $DB_OUTPUT $EXTRA_ARGS"
    echo
    echo "$FUNC: creating diamond DB in directory $PWD with command:"
    echo "$FUNC:     $cmd"
    echo
    eval $cmd
    rm -f $FAA_FILE
}

# create diamond DB from multiple files to be concatenated
function create_diamond_db_multiple() {
    DB_OUTPUT=$1
    shift
    DB_INPUTS=$*
    FUNC="create_diamond_db_multiple"
    FAA_FILE=${DB_OUTPUT}.faa
    zcat $DB_INPUTS > $FAA_FILE
    cmd="/usr/bin/time -v diamond makedb --in $FAA_FILE --threads $THREADS -d $DB_OUTPUT"
    echo
    echo "$FUNC: creating diamond DB in directory $PWD with command:"
    echo "$FUNC:     $cmd"
    echo
    eval $cmd
    rm -f $FAA_FILE
}


# get_db_single()
#
# Download updates for a database that is a single file with separate md5
# checksum file, using wget.
#
# Version of the download is dependent on DateSource

function get_db_single() {

    DB_DIR=$1       # $1  name to use for database directory
    URL_DIR=$2      # $2  base url/directory for wget
    DB_FILE=$3      # $3  data filename
    DB_MD5_FILE=$4  # $4  md5 checksum filename, md5sum -c with this checks $DB_FILE
    DB_OUTPUT=$5    # $5  name of output file
    USE_TAX=$6      # $6  true if compiling with taxonomy from files defined in $TAXON_NODES and $TAXON_MAP_
    FUNC="get_db_single"

    
    if [[ $USE_TAX == true ]]; then
      USE_TAX="--taxonmap $TAXONMAP --taxonnodes $TAXONNODES"
    else
      USE_TAX=""
    fi
    cd $ROOT
    mkdir -p $DB_DIR
    cd $DB_DIR
    TMPDIR=tmp.$$
    mkdir $TMPDIR || { echo "$FUNC: $DB_DIR temp directory $TMPDIR, error during mkdir"; exit 1; }
    cd $TMPDIR
    wget $WGET_OPTIONS $URL_DIR/$DB_MD5_FILE  # fetch the md5 file, preserving its server time
    [[ "$DateSource" = 'now' ]] && NEWVERSION="$TODAY" || NEWVERSION=`date --date=@$(stat -c'%Y' $DB_MD5_FILE) +"$DateFormat"`
    if [[ -d ../$NEWVERSION ]] && diff -q ../$NEWVERSION/download/$DB_MD5_FILE $DB_MD5_FILE ; then
        echo
        echo
        echo "$FUNC: $DB_DIR version $NEWVERSION exists at $ROOT/$DB_DIR/$NEWVERSION"
        echo "$FUNC: md5 files are also identical, not continuing update"
        echo
        echo
        cd ..
        #ln -sf $NEWVERSION latest || { echo "$FUNC: could not refresh 'latest' symlink"; exit 1; }
        make_latest_symlink  "$FUNC"  "$NEWVERSION"
        rm -rf $TMPDIR
    else
        wget $WGET_OPTIONS $URL_DIR/$DB_FILE  # fetch the database file
        if md5sum -c $DB_MD5_FILE ; then  # it looks good, update to this version
            echo "$FUNC: successfully downloaded update for $DB_DIR to $ROOT/$DB_DIR/$NEWVERSION"

            create_diamond_db_single  $DB_OUTPUT  $DB_FILE $USE_TAX

            # database is created in current directory, need to stash downloaded files into download/
            mkdir download && mv -vf $DB_FILE $DB_MD5_FILE download/ || { echo "could not move files to download/"; exit 1; }
            cd ..
            if [[ -d $NEWVERSION ]] ; then  # a previous download created this already
                rsync -rPt -v $TMPDIR/* $NEWVERSION/
                rm -rf $TMPDIR
            else
                mv -v $TMPDIR $NEWVERSION
            fi
            #{ rm -f latest && ln -sf $NEWVERSION latest; } || { echo "$FUNC: could not create 'latest' symlink"; exit 1; }
            make_latest_symlink  "$FUNC"  "$NEWVERSION"
            echo "$FUNC: successfully updated $DB_DIR to $ROOT/$DB_DIR/$NEWVERSION"
        else 
            echo "$FUNC: md5 checksum didn't match for $DB_FILE, removing $TMPDIR"
            cd ..
            rm -rf $TMPDIR
        fi
    fi
    cd $ROOT
}

function update_UniRef90() {

    # Download Uniref90 proteins.  These are versioned in the accompanying XML
    # document, so we load perl_modules/5.18.4 for xml_grep

    set +x
    module load perl/5.18.4
    module load perl_modules/5.18.4
    set -x

    cd $ROOT
    DB=UniRef90
    #DownloadDir=ftp://ftp.uniprot.org/pub/databases/uniprot/uniref/uniref90
    DownloadDir=ftp://ftp.expasy.org/databases/uniprot/current_release/uniref/uniref90
    mkdir -p $DB
    cd $DB
    TMPDIR=tmp.$$
    mkdir $TMPDIR
    cd $TMPDIR
    wget $WGET_OPTIONS $DownloadDir/RELEASE.metalink
    NEWVERSION=$(xml_grep --text_only version RELEASE.metalink)
    if [[ -d ../$NEWVERSION ]] && diff ../$NEWVERSION/download/RELEASE.metalink RELEASE.metalink ; then
        set +x
        echo
        echo
        echo "$0: $DB release $NEWVERSION already exists at $ROOT/$DB/$NEWVERSION and the RELEASE.metalink files are identical"
        echo "$0: Not continuing with $DB download but we will refresh the 'latest' symlink"
        echo
        echo
        set -x
        cd ..
        rm -rf $TMPDIR
        make_latest_symlink  "db $DB"  "$NEWVERSION"
    else
        wget $WGET_OPTIONS $DownloadDir/uniref90.fasta.gz

        create_diamond_db_single  uniref90  uniref90.fasta.gz

        mkdir download && mv -vf RELEASE.metalink uniref90.fasta.gz  download/    || { echo "could not move RELEASE.metalink and uniref90.fasta.gz to download/"; exit 1; }

        cd ..
        mv -v $TMPDIR $NEWVERSION
        make_latest_symlink  "db $DB"  "$NEWVERSION"
        echo "db $DB: successfully updated $DB to $ROOT/$DB/$NEWVERSION"
    fi

    cd $ROOT

    module unload perl_modules/5.18.4 perl/5.18.4
}


function update_RefSeq() {

    # Download RefSeq proteins.  These are versioned by release number

    cd $ROOT
    DB=RefSeq
    mkdir -p $DB
    cd $DB
    TMPDIR=tmp.$$
    mkdir $TMPDIR
    cd $TMPDIR
    wget $WGET_OPTIONS ftp://ftp.ncbi.nlm.nih.gov/refseq/release/RELEASE_NUMBER
    NEWVERSION=$(< RELEASE_NUMBER)
    if [[ -d ../$NEWVERSION ]] && diff ../$NEWVERSION/download/RELEASE_NUMBER RELEASE_NUMBER ; then
        set +x
        echo
        echo
        echo "$0: $DB release $NEWVERSION already exists at $ROOT/$DB/$NEWVERSION and the RELEASE_NUMBER files are identical"
        echo "$0: Not continuing with $DB download but we will refresh the 'latest' symlink"
        echo
        echo
        set -x
        cd ..
        rm -rf $TMPDIR
        make_latest_symlink  "db $DB"  "$NEWVERSION"
    else
        lftp ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete << __REFSEQ__
            mget -c complete.*.protein.faa.gz
__REFSEQ__

        create_diamond_db_multiple  complete.nonredundant_protein.protein  complete.nonredundant_protein.*.protein.faa.gz

        mkdir download && mv -vf complete.nonredundant_protein.*.protein.faa.gz  download/ || { echo "could not move complete.nonredundant_protein.*.protein.faa.gz files to download/"; exit 1; }

        create_diamond_db_multiple  complete.protein                       complete.*.protein.faa.gz

        mv -vf complete.*.protein.faa.gz  download/    || { echo "could not move complete.*.protein.faa.gz files to download/"; exit 1; }

        mv -vf RELEASE_NUMBER  download/    || { echo "could not move RELEASE_NUMBER to download/"; exit 1; }

        cd ..
        mv -v $TMPDIR $NEWVERSION
        make_latest_symlink  "db $DB"  "$NEWVERSION"
        echo "db $DB: successfully updated $DB to $ROOT/$DB/$NEWVERSION"
    fi
}

set -x

get_db_single  Blast  ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA  nr.gz         nr.gz.md5         nr        true

get_db_single  Blast  ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA  env_nr.gz     env_nr.gz.md5     env_nr

get_db_single  Blast  ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA  swissprot.gz  swissprot.gz.md5  swissprot

update_UniRef90

update_RefSeq


cd $ROOT

chgrp -hR sw .
chmod -R u+rwX,g+rwX,o+rX .
find . -type d -exec chmod g+s {} \;

unset TMPDIR
LOG=diamond-$(diamond version | cut -f3 -d' ')-database-compatibility-${TODAY}.log
find . -name '*.dmnd'| parallel -v --line-buffer -j 1 diamond getseq --db {} '|' head '>/dev/null' > "$LOG" 2>&1
cat "$LOG" | mailx -s "diamond database version compatibility $TODAY" lars.eklund@uppmax.uu.se

