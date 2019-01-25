Kraken database updates
=======================

The `Kraken2-update-db.sh` script is run once a month via the crontab on rackham5.

It builds four Kraken2 databases, using custom `_parallel` versions of the scripts that have been placed in the module directory of Kraken2.
These incorporate a pull request from the Kraken2 repository suggesting to parallelise dustmasker.

It builds the default database using `kraken2-build --standard`.

#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken2-update-db.sh
#SBATCH -p node
#SBATCH -n 20
#  Not necessary to use fat node for Kraken2.  Max on build of standard library was ~40GB
##SBATCH -C mem256GB
#SBATCH -t 24:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@ebc.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/uppnex/Kraken2/slurm-%j.out

K2_DB_BASE=/sw/data/uppnex/Kraken2
K2_VERSION=2.0.7-beta-bc14b13
THREADS=${1:-$SLURM_JOB_CPUS_PER_NODE}
#MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
#MINGB=200 # This now must run on a 256GB node, it needs just under 200GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken2 DB: '$1'"
	mailx -s "Kraken2 DB build error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
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

VERSION=$(date +'%Y%m%d')

cd $K2_DB_BASE
#mkdir $VERSION || error_send_email "In $K2_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )
K2_DB=$K2_DB_BASE/$VERSION
/usr/bin/time -v kraken2-build_parallel --standard --threads $THREADS --db $K2_DB
rm -f latest
ln -sf ./$VERSION latest
chgrp -hR sw ./$VERSION latest
chmod -R u+rwX,g+rwX,o+rX ./$VERSION
[[ -L latest ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link 'latest', quitting..."
for DB_TYPE in greengenes rdp silva
do
    DB=${VERSION}_${DB_TYPE}
    /usr/bin/time -v kraken2-build_parallel --special $DB_TYPE --threads $THREADS --db $K2_DB_BASE/$DB
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
#    | mailx -s "Kraken2 DB build successful: '$K2_DB'" douglas.scofield@ebc.uu.se

echo -e "In $K2_DB_BASE: prepared databases latest, greengenes, rdp, silva\n" \
    | mailx -s "Kraken2 DB build successful in $K2_DB_BASE" douglas.scofield@ebc.uu.se

