#!/bin/bash

# original version: get lineages list from busco/information
# new version:  (x) get lineages list from file_versions.tsv
#                   this combines all lineages together, no longer a separate virus list
#                   it also includes two additional columns: "Kingdom", and subdirectory
#               (x) include checking the md5 checksum which was included but we didn't use
#               (x) I'm gonna have to while my way through this file aren't I?
#               (x) double-check that wget didn't fail
#               (x) BUSCO_FILE filename components order different in information/ subdirectory
#               ( ) check if downloaded file expanded, if not expand it

BLS_BASE=/sw/data/BUSCO_data/latest/rackham/v5_lineage_sets

SITE=https://busco-data.ezlab.org/v5/data/
###WGET_OPTIONS="--quiet --continue"
WGET_OPTIONS="--quiet --continue"
echo "Updating lineage sets in $BLS_BASE"

mkdir -p $BLS_BASE
cd $BLS_BASE
#set -x
#set -e

CHANGES=0
VERSION=$(date +'%Y%m%d-%H%M%S')
echo "This run: VERSION=$VERSION"

function check_hash() {
    FILE="$1"
    HASH=$2
    if [[ $(md5sum "$FILE" | cut -f1 -d" ") != $HASH ]] ; then
        echo "computed hash for '$FILE' does not match expected hash $HASH"
        exit 1
    fi
}

function fetch_busco_files() {
    local FILEBASE=$1
    local DATE=$2
    local HASH=$3
    local DOMAIN=$4
    local SUBDIR=$5
    [[ "$SUBDIR" && "$DOMAIN" ]] || { echo "missing arguments from file_versions line, exiting"; exit 1; }
    if [[ "$SUBDIR" == "information" || "$SUBDIR" == "placement_files" ]] ; then
        local SUFFIX="${FILEBASE##*.}"
        local NO_SUFFIX="${FILEBASE%.$SUFFIX}"
        local BUSCO_FILE="$SUBDIR/${NO_SUFFIX}.$DATE.$SUFFIX.tar.gz"
    else
        local BUSCO_FILE="$SUBDIR/$FILEBASE.$DATE.tar.gz"
    fi
    local EXPAND=yes # default
    local SUBEXPAND=yes # expand refseq_db.faa.gz within lineage set
    mkdir -p $SUBDIR
    echo -ne "Fetching busco file ${BUSCO_FILE} ... "
    if test -f ${BUSCO_FILE} ; then
        local NEW=${BUSCO_FILE}.$VERSION
        wget $WGET_OPTIONS -O $NEW $SITE/${BUSCO_FILE} || { echo "Could not download existing $SUBDIR remote file '$SITE/${BUSCO_FILE}'"; exit 1; }
        check_hash $NEW $HASH
        if diff ${BUSCO_FILE} $NEW > /dev/null 2>&1 ; then
            echo -n "$NEW contains no new content ... "
            rm -f $NEW
            if [[ $SUBDIR == "lineages" ]] ; then
                if test -d $SUBDIR/$FILEBASE ; then
                    echo -n " $SUBDIR/$FILEBASE directory found, not expanding ... "
                    EXPAND=
                else
                    echo -n " No $SUBDIR/$FILEBASE directory found ... "
                    (( CHANGES++ ))
                fi
            else  # information or placement_files : these tarballs expand to single files
                local UNPACKED_FILE=$SUBDIR/$NO_SUFFIX.$DATE.$SUFFIX
                if [[ ! -f $UNPACKED_FILE ]] ; then
                    echo -n " No $UNPACKED_FILE file found ... "
                    (( CHANGES++ ))
                else
                    echo -n " Found $UNPACKED_FILE file ... "
                    EXPAND=
                fi
            fi
        else
            echo -n "found update! ... "
            (( CHANGES++ ))
            mv -f $NEW ${BUSCO_FILE}
            if [[ $SUBDIR == "lineages" ]] ; then
                if test -d $SUBDIR/$FILEBASE ; then
                    echo -n " Existing $SUBDIR/$FILEBASE directory found, removing ... "
                    rm -rf $SUBDIR/$FILEBASE
                fi
            else  # information or placement_files : these tarballs expand to single files
                local UNPACKED_FILE=$SUBDIR/$NO_SUFFIX.$DATE.$SUFFIX
                if test -f $UNPACKED_FILE ; then
                    echo -n " Existing $UNPACKED_FILE file found, removing ... "
                    rm -f $UNPACKED_FILE
                fi
            fi
        fi
    else
        echo -n "this is a new $SUBDIR."
        (( CHANGES++ ))
        wget $WGET_OPTIONS --timestamping -P $SUBDIR $SITE/${BUSCO_FILE} || { echo "Could not download new $SUBDIR remote file '$SITE/${BUSCO_FILE}'"; exit 1; }
        check_hash $BUSCO_FILE $HASH
    fi
    if [[ "$EXPAND" ]] ; then
        echo -n " Expanding ... "
        tar xf ${BUSCO_FILE} -C $SUBDIR
        if [[ $SUBDIR == "lineages" ]] ; then
            if [[ "$SUBEXPAND" ]] ; then
                if [[ -f "$SUBDIR/$FILEBASE/refseq_db.faa.gz" ]] ; then # we expect that each has a md5
                    (
                        cd "$SUBDIR/$FILEBASE"
                        local seqgz=refseq_db.faa.gz
                        echo -n " Checking MD5 for $seqgz ... "
                        [[ -f $seqgz.md5 ]] || { echo "no $seqgz.md5 file"; exit 1; }
                        check_hash $seqgz $(cut -f1 -d" " $seqgz.md5)
                        echo -n " Subexpanding ... "
                        cp -p $seqgz $seqgz.orig
                        gunzip $seqgz
                        mv $seqgz.orig $seqgz
                    )
                fi
            fi
            touch $SUBDIR/$FILEBASE.done
        fi
    else
        echo -n " Touching ${BUSCO_FILE}_checked ... "
        touch ${BUSCO_FILE}_checked
    fi
    echo "done."
}

# Download temp version of file_versions.tsv to specify which files to download
for FV in file_versions.tsv file_versions.tsv.hash ; do
    wget ${WGET_OPTIONS} -O $FV.$VERSION ${SITE}/$FV
done
#wget ${WGET_OPTIONS} ${SITE}/file_versions.tsv
#wget ${WGET_OPTIONS} ${SITE}/file_versions.tsv.hash
check_hash file_versions.tsv.$VERSION $(cut -f1 -d" " file_versions.tsv.hash.$VERSION)
if [[ -f file_versions.tsv ]] && diff file_versions.tsv file_versions.tsv.$VERSION > /dev/null 2>&1 ; then
    echo "no new content according to file_versions.tsv ; this will only be correct if everything is already downloaded"
    rm -f file_versions.tsv.$VERSION file_versions.tsv.hash.$VERSION 
else
    echo "new content in file_versions.tsv ; replacing and keeping previous with prefix .old-$VERSION"
    [[ -f file_versions.tsv ]] && mv -v file_versions.tsv file_versions.tsv.old-$VERSION
    [[ -f file_versions.tsv.hash ]] && mv -v file_versions.tsv.hash file_versions.tsv.hash.old-$VERSION
    mv -v file_versions.tsv.$VERSION file_versions.tsv
    mv -v file_versions.tsv.hash.$VERSION file_versions.tsv.hash
fi


# Loop over every species and update if necessary 

while IFS=$'\t' read -r filebase date hash domain subdir
do
    fetch_busco_files $filebase $date $hash $domain $subdir
done < file_versions.tsv
##done < <( grep -P '(information|placement_files)' file_versions.tsv)

echo "Made $CHANGES changes"

if (( $CHANGES > 0 )) ; then
    echo "Updating groups and permissions ..."
    cd $BLS_BASE
    #chgrp -hR sw *
    #chmod -R u+rwX,g+rwX,o+rX-w *
    #find . -type d -exec chmod g+s {} \;

    # lineages/ and everything in it, which takes a long time
    /sw/data/blast_scripts/fixup .
fi

echo "Done."
