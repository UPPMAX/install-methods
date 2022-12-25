#!/bin/bash

#SBATCH -A staff
#SBATCH -J KrakenUniq_data-update-custom-db.sh
#SBATCH -M rackham
#SBATCH -p node
#SBATCH -n 20
#SBATCH -C mem1TB
#SBATCH -t 5-00:00:00
##SBATCH --qos=uppmax_staff_4nodes
#SBATCH --mail-user douglas.scofield@uppmax.uu.se
#SBATCH --mail-type=ALL
#SBATCH -o /sw/data/KrakenUniq_data/slurm-rackham-mem1TB-%j.out

echo
echo "Script running: $0"
echo

[[ $1 == "-f" ]] && { shift; FORCE=yes; } || FORCE=

K_DB_BASE=/sw/data/KrakenUniq_data
K_VERSION=1.0.1
THREADS=${20:-$SLURM_JOB_CPUS_PER_NODE}
#MEMGB=${SLURM_MEM_PER_NODE%???}  # truncated value, remove last 3 chars (128GB node reports 128000)
#MINGB=1000 # This now must run on a 512 node, it needs just under 300GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken DB: '$1'"
	mailx -s "Kraken DB build error: '$1'" douglas.scofield@uppmax.uu.se <<< $MSG
    exit 1
}

#if [[ ! $FORCE ]] ; then
#    (( MEMGB >= MINGB )) || error_send_email "This node has $MEMGB GB but needs at least $MINGB GB"
#fi

echo "$0: working with $THREADS threads on a node with SLURM_MEM_PER_NODE = $SLURM_MEM_PER_NODE"

set -e

module load bioinfo-tools
module load KrakenUniq/$K_VERSION

#set -x

VERSION="$(date +'%Y%m%d-%H%M%S')-custom"
K_DB=$K_DB_BASE/$VERSION

cd $K_DB_BASE
mkdir $VERSION || error_send_email "In $K_DB_BASE, new directory '$VERSION' exists, quitting..."

# comment krakenuniq-build and uncomment cd;touch to test the script
# ( cd $VERSION ; touch a1 a2 a3 )

# Attempt three restarts of each build

function redo_thrice()
{
   local cmd="$1"
   eval "$cmd" || eval "$cmd" || eval "$cmd" || { echo "could not complete command '$cmd', exiting"; exit 1; }
}

cmd="krakenuniq-download  --threads $THREADS  --db $K_DB                 taxonomy"
redo_thrice "$cmd"
cmd="krakenuniq-download  --threads $THREADS  --db $K_DB                 refseq/bacteria   refseq/archaea"
redo_thrice "$cmd"
cmd="krakenuniq-download  --threads $THREADS  --db $K_DB                 refseq/viral/Any  viral-neighbors"
redo_thrice "$cmd"
cmd="krakenuniq-download  --threads $THREADS  --db $K_DB  --dust  --taxa 'archaea,bacteria,viral,fungi,protozoa,parasitic_worms'  --exclude-environmental-taxa  nt"
redo_thrice "$cmd"
cmd="krakenuniq-build     --threads $THREADS  --db $K_DB  --kmer-len 31  --taxids-for-genomes  --taxids-for-sequences"
redo_thrice "$cmd"


rm -f latest-custom
ln -sf ./$VERSION latest-custom
chgrp -hR sw ./$VERSION latest-custom
chmod -R u+rwX,g+rwX,o+rX ./$VERSION

[[ -L latest-custom ]] || error_send_email "In $K_DB_BASE, did not create symbolic link '$K_DB_LATEST', quitting..."

#MF_K=/sw/mf/common/bioinfo-tools/misc/Kraken/$K_VERSION
#sed -i -e "s/Downloaded: [0-9]\+/Downloaded: $VERSION/" $MF_K
#
#echo -e "In $K_DB_BASE, prepared $K_DB and linked 'latest' to $K_DB; double-check the mf file $MF_K below:\n\n" \
#    | cat - $MF_K \
#    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@uppmax.uu.se

echo -e "In $K_DB_BASE, prepared $K_DB and linked 'latest-custom' to $K_DB\n\n" \
    | mailx -s "Kraken DB build successful: '$K_DB'" douglas.scofield@uppmax.uu.se

