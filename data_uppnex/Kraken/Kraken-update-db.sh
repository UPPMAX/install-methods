#!/bin/bash

#SBATCH -A staff
#SBATCH -J Kraken-update-db.sh
#SBATCH -p node
#SBATCH -n 16
#SBATCH -C mem256GB
#SBATCH -t 12:00:00
#SBATCH --mail-user douglas.scofield@ebc.uu.se
#SBATCH --mail-type=ALL

K_DB_BASE=/sw/data/uppnex/Kraken
K_VERSION=1.0
THREADS=${1:-$SLURM_NPROCS}

# This now must run on a 256GB node, it needs just under 200GB to build the standard database

function error_send_email()
{
    MSG="Error while building Kraken DB: '$1'"
	mailx -s "Kraken DB build error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
    exit 1
}


# building the standard database now must run on a fat node
# [[ $(uname -n) = 'milou-b.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on milou-b"

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

