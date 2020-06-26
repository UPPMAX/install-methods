#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken2-update-nt.sh
#SBATCH -p node
#SBATCH -n 20
#  Not necessary to use fat node for Kraken2, but yes for nt.  Max on build of standard library was ~40GB
#SBATCH -C mem256GB
#SBATCH -t 24:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user lars.eklund@uppmax.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/Kraken2/slurm-nt-%j.out

# For nt, calculated it needs 124016360592 bytes to build the database, which is 115GiB (1GiB=1024^3 bytes)
# that will fit on a mem256GB node

K2_DB_BASE=/sw/data/Kraken2
K2_VERSION=2.0.8-beta
THREADS=${1:-$SLURM_JOB_CPUS_PER_NODE}
export KRAKEN2_THREAD_COUNT=$THREADS
#MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
#MINGB=200 # This now must run on a 256GB node, it needs just under 200GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken2 DB: '$1'"
	mailx -s "Kraken2 DB build error: '$1'" lars.eklund@uppmax.uu.se <<< $MSG
    exit 1
}

#(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
#
#echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set -e

module load bioinfo-tools
module load Kraken2/$K2_VERSION
module load gnuparallel/20180822

#set -x

VERSION=$(date +'%Y%m%d-%H%M%S')

cd $K2_DB_BASE
#mkdir $VERSION || error_send_email "In $K2_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )

for DB_TYPE in nt ; do
    DBNAME=${VERSION}_${DB_TYPE}
    DB=$K2_DB_BASE/$DBNAME
    /usr/bin/time -v kraken2-build_parallel --use-ftp --download-taxonomy --db $DB
    /usr/bin/time -v kraken2-build_parallel --use-ftp --download-library $DB_TYPE --db $DB
    /usr/bin/time -v kraken2-build_parallel --use-ftp --build --threads $THREADS --db $DB
    LN=latest_${DB_TYPE}
    rm -f $LN
    ln -sf ./$DBNAME $LN
    chgrp -hR sw ./$DBNAME $LN
    chmod -R u+rwX,g+rwX,o+rX ./$DBNAME
    [[ -L $LN ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link '$LN' to '$DBNAME', quitting..."
done

echo -e "In $K2_DB_BASE: prepared databases nt\n" \
    | mailx -s "Kraken2 nt DB build successful as $DBNAME in $K2_DB_BASE" lars.eklund@uppmax.uu.se

