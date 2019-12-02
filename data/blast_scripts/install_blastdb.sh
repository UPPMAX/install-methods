#!/bin/bash

# Install new blast dbs in these directories to /sw/data/uppnex/blast_databases:
#
# * /sw/data/uppnex/blast_tmp/blastdb/
# * /sw/data/uppnex/blast_tmp/uniprot/blastdb/
#
# These could be a partial list of the dbs we make available, if there were no
# updates in this round of downloads.
#
# 1. create _new directory
# 2. populate _new with hard links from the existing install directory
# 3. for each db with a .timestamp file in the staged directories
#   a. remove all its same-prefix hardlinks from _new
#   b. mv its same-prefix files from the staged directory to _new
#   c. make sure issues that might arise when a multipart db shrinks are avoided
# 4. mv install directory to _old
# 5. mv _new to install directory
#
# This script will remove the directory of old inactive databases if it exists,
# before moving the current to the old.  But it should already be removed by a cron
# job which runs 24 hours after this one.

#set -x
set -e

shopt -s nullglob  # this will make STAGED_DBS_TIMESTAMPS be empty if the globs match nothing

STAGED_DBS_TIMESTAMPS=( /sw/data/uppnex/blast_tmp/blastdb/*.timestamp /sw/data/uppnex/blast_tmp/uniprot/blastdb/*.timestamp )

INSTALL=/sw/data/uppnex/blast_databases
OLD=${INSTALL}_old
NEW=${INSTALL}_new

[[ -e $INSTALL ]] || { echo "$0: something wrong, $INSTALL does not exist"; exit 1; }

[[ ! -e $NEW ]] || { echo "$0: $NEW already exists"; exit 1; }
mkdir $NEW
chgrp sw $NEW
chmod u+rwX,g+rwsX,o+rX-w $NEW

# populate _new, and fill with hard links to dbs in install
cd $NEW
echo -e "$NEW: creating hardlinks to existing dbs ..."
ln $INSTALL/* .

for S in ${STAGED_DBS_TIMESTAMPS[@]} ; do
    SS=${S%.timestamp}
    DB=${SS##*/}
    echo -e "\n$S found staged"
    ALL_SS=(${SS}.*)
    if [[ ${#ALL_SS[@]} == 1 ]] ; then
        echo "Only the timestamp file was found; will only unlik the old timestamp and link the new timestamp"
        rm -f ${DB}.timestamp
        echo "Existing database files not touched: " ${DB}.*
        ln ${SS}.timestamp .
        continue
    fi
    echo -ne "    $DB:$NEW: removing hardlinks to existing ... "
    rm -f ${DB}.*
    [[ $DB == UniVec || $DB == UniVec_Core ]] && rm -f ${DB}
    echo -e "creating hardlinks to staged... "
    ln ${SS}.* . || { echo -e "$0: Failed to hardlink '${SS}.*'\n" | mailx -s "blast database installation error" lars.eklund@uppmax.uu.se; exit 1; }
    [[ $DB == UniVec || $DB == UniVec_Core ]] && ln ${SS} .
done

[[ -e $OLD ]] && { echo -e "\nremoving $OLD ..."; rm -vrf $OLD; }

echo -e "$0: $INSTALL to $OLD and $NEW to $INSTALL"
mv -v $INSTALL $OLD
mv -v $NEW $INSTALL

echo -e "$0: Installed blast databases to $INSTALL\n$0: now check on old databases in $OLD\n" | mailx -s "blast databases installed" lars.eklund@uppmax.uu.se

