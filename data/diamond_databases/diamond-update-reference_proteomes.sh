#!/bin/bash 

ROOT=/sw/data/diamond_databases

cd $ROOT

module load bioinfo-tools
module load diamond/2.1.9
module load blast/2.15.0+
module load gnuparallel/20230422
module load perl_modules/5.32.1  # provides xml_grep
module load ncbi_taxonomy/latest


THREADS=40
DateFormat='%Y%m%d-%H%M%S'  # used for databases where the version tag is date-time
DateSource='now'  # 'now' means use today's date as in TODAY below, otherwise means use date on downloaded md5 checksum file
TODAY=`date +"$DateFormat"`
#TAXONMAP=/sw/data/ncbi_taxonomy/latest/accession2taxid/prot.accession2taxid.FULL.gz
#TAXONNODES=/sw/data/ncbi_taxonomy/latest/nodes.dmp
#TAXONNAMES=/sw/data/ncbi_taxonomy/latest/names.dmp
TAXONMAP=$NCBI_TAXONOMY_ROOT/accession2taxid/prot.accession2taxid.FULL.gz
TAXONNODES=$NCBI_TAXONOMY_ROOT/nodes.dmp
TAXONNAMES=$NCBI_TAXONOMY_ROOT/names.dmp
WGET_OPTIONS="--quiet --timestamping"

echo "$0: building databases with $(diamond version)"

set -x

# TODO: for get_db_single(), when checking for previous download, we should compare md5 against previous md5s, if they exist
# TODO: for uniref90, extract md5 sum from xml and check against it

function error_send_email() {
    MSG="Error within $0: '$1'"
	mailx -s "$0 error: '$1'" douglas.scofield@uppmax.uu.se <<< $MSG
    exit 1
}

function make_latest_symlink() {
    FUNC=$1
    NEWVERSION=$2
    { rm -f latest && ln -sf $NEWVERSION latest; } || { echo "$FUNC: could not create 'latest' symlink"; exit 1; }
}

#[[ $(uname -n) = 'rackham5.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on rackham5"

set -e


# create diamond DB from a single file, but most simply
function create_diamond_db_simple() {
    FUNC="create_diamond_db_simple"
    DB_OUTPUT=$1
    DB_INPUT=$2
    shift;shift
    EXTRA_ARGS="$@" #This allows for passing any new or future options when creating the db if no args given none are set.
    cmd="/usr/bin/time -v diamond makedb  --db $DB_OUTPUT  --in $DB_INPUT  --threads $THREADS  $EXTRA_ARGS"
    echo
    echo "$FUNC: creating diamond DB in directory $PWD with command:"
    echo "$FUNC:     $cmd"
    echo
    eval $cmd
}

# create diamond DB from a single file
function create_diamond_db_single() {
    FUNC="create_diamond_db_single"
    DB_OUTPUT=$1
    DB_INPUT=$2
    cd $ROOT
    shift;shift
    EXTRA_ARGS="$@" #This allows for passing any new or future options when creating the db if no args given none are set.
    FUNC="create_diamond_db_single"
    FAA_FILE=${DB_OUTPUT}.faa
    zcat $DB_INPUT > $FAA_FILE
    cmd="/usr/bin/time -v diamond makedb --in $FAA_FILE --threads $THREADS --db $DB_OUTPUT $EXTRA_ARGS"
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
    FAAGZ_FILE=${DB_OUTPUT}.faa.gz
    cat $DB_INPUTS > $FAAGZ_FILE  # you can cat gzipped files together into a single gzipped file
    cmd="/usr/bin/time -v diamond makedb --in $FAAGZ_FILE --threads $THREADS --db $DB_OUTPUT"
    echo
    echo "$FUNC: creating diamond DB in directory $PWD with command:"
    echo "$FUNC:     $cmd"
    echo
    eval $cmd
    rm -f $FAAGZ_FILE
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
    USE_TAX=$6      # $6  true if compiling with taxonomy from files defined in \$TAXONNODES \$TAXONNAMES \$TAXONMAP
    FUNC="get_db_single"

    
    if [[ $USE_TAX == true ]]; then
      USE_TAX="--taxonmap $TAXONMAP --taxonnames $TAXONNAMES --taxonnodes $TAXONNODES"
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

            create_diamond_db_simple  $DB_OUTPUT  $DB_FILE  $USE_TAX    # no need to use _single as diamond can handle gzipped files directly

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

function update_UniProt_reference_proteomes() {

    # Download UniProt reference proteomes.  These are versioned in the accompanying XML
    # document, so we load perl_modules/5.26.2 for xml_grep

    cd $ROOT
    DB=reference_proteomes
    DownloadDir=ftp://ftp.expasy.org/databases/uniprot/current_release/knowledgebase/$DB
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
        # complicated process based on what Blobtoolkit does

        wget $WGET_OPTIONS $DownloadDir/Reference_Proteomes_${NEWVERSION}.tar.gz

        tar xf Reference_Proteomes_${NEWVERSION}.tar.gz

        touch reference_proteomes.fasta.gz
        find . -mindepth 2 | grep "fasta.gz" | grep -v 'DNA' | grep -v 'additional' | xargs cat >> reference_proteomes.fasta.gz

        printf "accession\taccession.version\ttaxid\tgi\n" > reference_proteomes.taxid_map
        zcat */*/*.idmapping.gz | grep "NCBI_TaxID" | awk '{print $1 "\t" $1 "\t" $3 "\t" 0}' >> reference_proteomes.taxid_map

        USE_TAX="--taxonmap reference_proteomes.taxid_map --taxonnames $TAXONNAMES --taxonnodes $TAXONNODES"

        create_diamond_db_simple  reference_proteomes.dmnd  reference_proteomes.fasta.gz  $USE_TAX

        mkdir download && mv -vf RELEASE.metalink README Reference_Proteomes_${NEWVERSION}.tar.gz reference_proteomes.fasta.gz reference_proteomes.taxid_map  download/    || { echo "could not move RELEASE.metalink and reference_proteomes.* to download/"; exit 1; }

        rm -rf Archaea Bacteria Eukaryota Viruses

        cd ..
        mv -v $TMPDIR $NEWVERSION
        make_latest_symlink  "db $DB"  "$NEWVERSION"
        echo "db $DB: successfully updated $DB to $ROOT/$DB/$NEWVERSION"
    fi
    cd $ROOT
}


update_UniProt_reference_proteomes


cd $ROOT

chgrp sw reference_proteomes
chmod u+rwX,g+rwX,o+rX reference_proteomes
chmod g+s reference_proteomes
$ROOT/fixup reference_proteomes

