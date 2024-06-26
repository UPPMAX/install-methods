#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken2-update-nt.sh
#  Now must use mem2TB node on snowy
#
#SBATCH -M snowy
#SBATCH -p veryfat
#SBATCH -C mem2TB
#SBATCH -n 64

## no longer possible to use mem1TB node 
##SBATCH -p node
##SBATCH -n 20
##SBATCH -M rackham
##SBATCH -C mem1TB
#
#SBATCH -t 10-00:00:00
#
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@uppmax.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/Kraken2_data/slurm-update-nt-rackham-mem1TB-%j.out

# 2024-04-08 remove --use-ftp from build commands

K2_DB_BASE=/sw/data/Kraken2_data
K2_DB_TMP=$K2_DB_BASE/_tmp_Kraken2-build.$$

K2_VERSION=2.1.3-20231102-acc2248

#THREADS=${SLURM_JOB_CPUS_PER_NODE:-20}
THREADS=${SLURM_JOB_CPUS_PER_NODE:-64}
export KRAKEN2_THREAD_COUNT=$THREADS
#MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
#MINGB=200 # This now must run on a 256GB node, it needs just under 200GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken2 DB: '$1'"
	mailx -s "Kraken2 DB build error: '$1'" douglas.scofield@uppmax.uu.se <<< $MSG
    exit 1
}

#(( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
#
#echo "$0: working with $THREADS threads on a node with at least $MEMGB GB.  On rackham 12h wasn't enough on 20180302 so running for 24h"

set -e

module load bioinfo-tools
module load Kraken2/$K2_VERSION

#set -x

VERSION=$(date +'%Y%m%d-%H%M%S')

#mkdir $VERSION || error_send_email "In $K2_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment kraken-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )

for DB_TYPE in nt ; do
    mkdir $K2_DB_TMP
    cd $K2_DB_TMP
    DBNAME=${VERSION}_${DB_TYPE}
    DB=$PWD/$DBNAME
    echo "$0 : within $KR_DB_TMP, building $DBNAME into $DB ..."
    /usr/bin/time -v kraken2-build --download-taxonomy --db $DB
    /usr/bin/time -v kraken2-build --download-library $DB_TYPE --db $DB
    # /usr/bin/time -v kraken2-build --build --threads $THREADS --db $DB  # known issue gets trapped https://github.com/DerrickWood/kraken2/issues/428  temporary workaround --fast-build
    /usr/bin/time -v kraken2-build --build --fast-build --threads $THREADS --db $DB
    mv -v ./$DBNAME $K2_DB_BASE/
    cd $K2_DB_BASE/
    echo "$0 : moved $DBNAME into $K2_DB_BASE"
    rm -rf $K2_DB_TMP
    echo "$0 : removed $K2_DB_TMP"
    LN=latest_${DB_TYPE}
    rm -f $LN
    ln -sf ./$DBNAME $LN
    chgrp -hR sw ./$DBNAME $LN
    chmod -R u+rwX,g+rwX,o+rX ./$DBNAME
    echo "$0 : linked $LN to $DBNAME"
    [[ -L $LN ]] || error_send_email "In $K2_DB_BASE, did not create symbolic link '$LN' to '$DBNAME', quitting..."
done

echo -e "In $K2_DB_BASE: prepared databases nt\n" \
    | mailx -s "Kraken2 nt DB build successful as $DBNAME in $K2_DB_BASE" douglas.scofield@uppmax.uu.se

