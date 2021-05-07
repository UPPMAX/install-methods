#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken-update-db.sh
#SBATCH -M rackham
#SBATCH -p node
#SBATCH -n 20
#SBATCH -C mem1TB
#SBATCH -t 72:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@uppmax.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/Kraken/slurm-rackham-mem1TB-%j.out

K_DB_BASE=/sw/data/Kraken
K_VERSION=1.1.1
THREADS=${1:-$SLURM_JOB_CPUS_PER_NODE}
MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
MINGB=500 # This now must run on a 512 node, it needs just under 300GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken DB: '$1'"
	mailx -s "Kraken DB build error: '$1'" douglas.scofield@uppmax.uu.se <<< $MSG
    exit 1
}

(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"

echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set -e

module load bioinfo-tools
module load Kraken/$K_VERSION

#set -x

VERSION=$(date +'%Y%m%d-%H%M%S')
K_DB=$K_DB_BASE/$VERSION

cd $K_DB_BASE
#mkdir $VERSION || error_send_email "In $K_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )
#/usr/bin/time -v kraken-build --use-wget --download-taxonomy --threads $THREADS --db $K_DB
/usr/bin/time -v kraken-build --use-wget --standard --threads $THREADS --db $K_DB

rm -f latest
ln -sf ./$VERSION latest
chgrp -hR sw ./$VERSION latest
chmod -R u+rwX,g+rwX,o+rX ./$VERSION

[[ -L latest ]] || error_send_email "In $K_DB_BASE, did not create symbolic link '$K_DB_LATEST', quitting..."

#MF_K=/sw/mf/common/bioinfo-tools/misc/Kraken/$K_VERSION
#sed -i -e "s/Downloaded: [0-9]\+/Downloaded: $VERSION/" $MF_K
#
#echo -e "In $K_DB_BASE, prepared $K_DB and linked 'latest' to $K_DB; double-check the mf file $MF_K below:\n\n" \
#    | cat - $MF_K \
#    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@uppmax.uu.se

echo -e "In $K_DB_BASE, prepared $K_DB and linked 'latest' to $K_DB\n\n" \
    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@uppmax.uu.se

