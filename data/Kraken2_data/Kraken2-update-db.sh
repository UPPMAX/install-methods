#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken2-update-db.sh
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -n 16
#SBATCH -C mem512GB
#  Not necessary to use fat node for Kraken2.  Max on build of standard library was ~40GB
#SBATCH -t 10-00:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@uppmax.uu.se
#SBATCH --mail-type=ALL
##SBATCH -o /sw/data/Kraken2_data/slurm-update-db-rackham-mem256GB-%j.out
#SBATCH -o /sw/data/Kraken2_data/slurm-update-db-snowy-mem512GB-%j.out

# 2024-04-08 remove --use-ftp from build commands

set -x

function error_send_email()
{
    MSG="Error while building Kraken2 DB: '$1'"
	mailx -s "Kraken2 DB build error: '$1'" douglas.scofield@uppmax.uu.se <<< $MSG
    exit 1
}

K2_DB_BASE=/sw/data/Kraken2_data

K2_VERSION=2.1.3-20231102-acc2248

THREADS=${SLURM_JOB_CPUS_PER_NODE:-20}
[[ -z "$THREADS" ]] && error_send_email "Threads count misconfigured: THREADS=$THREADS"
export KRAKEN2_THREAD_COUNT=$THREADS

#(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
#
#echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set +x

module load bioinfo-tools
module load Kraken2/$K2_VERSION

set -x
set -e

VERSION=$(date +'%Y%m%d-%H%M%S')

cd $K2_DB_BASE
#mkdir $VERSION || error_send_email "In $K2_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )
K2_DB=$K2_DB_BASE/$VERSION
# if the first attempt fails, sleep 5 minutes and try again; if that fails, sleep 10 minutes and try one last time
kraken2-build --standard --threads $THREADS --db $K2_DB || ( sleep 300; kraken2-build --standard --threads $THREADS --db $K2_DB || ( sleep 600; kraken2-build --standard --threads $THREADS --db $K2_DB ) )
rm -f latest
ln -sf ./$VERSION latest
chgrp -hR sw ./$VERSION latest
chmod -R u+rwX,g+rwX,o+rX ./$VERSION
[[ -L latest ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link 'latest', quitting..."
for DB_TYPE in greengenes silva
do
    DB=${VERSION}_${DB_TYPE}
    # if the first attempt fails, sleep 5 minutes and try again; if that fails, sleep 10 minutes and try one last time
    kraken2-build  --special $DB_TYPE --threads $THREADS --db $K2_DB_BASE/$DB || ( sleep 300; kraken2-build --special $DB_TYPE --threads $THREADS --db $K2_DB_BASE/$DB || ( sleep 600; kraken2-build --special $DB_TYPE --threads $THREADS --db $K2_DB_BASE/$DB ) )
    LN=latest_${DB_TYPE}
    rm -f $LN
    ln -sf ./$DB $LN
    chgrp -hR sw ./$DB $LN
    chmod -R u+rwX,g+rwX,o+rX ./$DB
    [[ -L $LN ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link '$LN', quitting..."
done

#MF_K=/sw/mf/common/bioinfo-tools/misc/Kraken2/$K2_VERSION
#sed -i -e "s/Downloaded: [0-9]\+/Downloaded: $VERSION/" $MF_K
#
#echo -e "In $K2_DB_BASE, prepared $K2_DB and linked 'latest' to $K2_DB; double-check the mf file $MF_K below:\n\n" \
#    | cat - $MF_K \
#    | mailx -s "Kraken2 DB build successful: '$K2_DB'" douglas.scofield@uppmax.uu.se

echo -e "In $K2_DB_BASE: prepared databases latest, greengenes, silva\n" \
    | mailx -s "Kraken2 DB build successful in $K2_DB_BASE" douglas.scofield@uppmax.uu.se

