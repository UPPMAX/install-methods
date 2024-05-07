#!/bin/bash

#SBATCH -A staff
#SBATCH -J MEMEsuite-update-db.sh
#SBATCH -p node
#SBATCH -n 1
#SBATCH -t 24:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@uppmax.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/MEMEsuite/slurm-%j.out

DB_NAME=MEMEsuite
DB_BASE=/sw/data/$DB_NAME
TOOL_NAME=MEMEsuite
TOOL_VERSION=5.1.1

MAINTAINER="douglas.scofield@uppmax.uu.se"

function error_send_email()
{
    MSG="Error while building ${DB_NAME} DB: '$1'"
	mailx -s "${DB_NAME} DB build error: '$1'" "$MAINTAINER" <<< $MSG
    exit 1
}

#(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
#
#echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set -e

module load bioinfo-tools
module load $TOOL_NAME/$TOOL_VERSION

set -x

DATA_VERSION=$(date +'%Y%m%d-%H%M%S')

cd $DB_BASE
mkdir $DATA_VERSION || error_send_email "In $DB_BASE, new directory '$DATA_VERSION' exists, quitting..."

DATA_PREFIX=$DB_BASE/$DATA_VERSION
cd $DATA_PREFIX
mkdir downloads

update-sequence-db $DATA_PREFIX/fasta_databases

# Motif, GOMO, tgene databases

cd $DATA_PREFIX

url=http://meme-suite.org/meme-software/Databases
for dbpath in  motifs/motif_databases.12.19.tgz gomo/gomo_databases.3.2.tgz tgene/tgene_databases.1.0.tgz ; do
    db=${dbpath#*/}
    dbname=${db%%.*}
    wget --timestamping -O $db $url/$dbpath
    tar xzf $db
    [[ -d $dbname ]] || error_send_email "$db did not unpack to $dbname"
    mv $db downloads
done


# update latest link

cd $DB_BASE

rm -f latest
ln -sf ./$DATA_VERSION latest
chgrp -hR sw ./$DATA_VERSION latest
chmod -R u+rwX,g+rwX,o+rX ./$DATA_VERSION
[[ -L latest ]] || error_send_email "In $DB_BASE, did not create symbolic link 'latest', quitting..."


echo -e "In $DB_BASE: prepared databases latest\n" \
    | mailx -s "MEMEsuite DB build successful in $DB_BASE" "$MAINTAINER"

