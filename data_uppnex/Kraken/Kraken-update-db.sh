#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken-update-db.sh
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -n 16
#SBATCH -C mem512GB
#SBATCH -t 24:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@ebc.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/uppnex/Kraken/slurm-snowy-%j.out

K_DB_BASE=/sw/data/uppnex/Kraken
K_VERSION=1.0
THREADS=${1:-$SLURM_JOB_CPUS_PER_NODE}
MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
MINGB=200 # This now must run on a 256GB node, it needs just under 200GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken DB: '$1'"
	mailx -s "Kraken DB build error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
    exit 1
}

(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"

echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set -e

module load bioinfo-tools
module load Kraken/$K_VERSION

#set -x

VERSION=$(date +'%Y%m%d')
K_DB=$K_DB_BASE/$VERSION

cd $K_DB_BASE
#mkdir $VERSION || error_send_email "In $K_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )
/usr/bin/time -v kraken-build --standard --threads $THREADS --db $K_DB

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
#    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@ebc.uu.se

echo -e "In $K_DB_BASE, prepared $K_DB and linked 'latest' to $K_DB\n\n" \
    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@ebc.uu.se

