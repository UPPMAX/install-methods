#!/bin/bash

K_DB_BASE=/sw/data/uppnex/Kraken
K_VERSION=0.10.5-beta
THREADS=${1:-16}

# The first time I did this (20151201), apart from the ftp messages, I got
#
# Unpacking... complete.
# Kraken build set to minimize disk writes.
# Creating k-mer set (step 1 of 6)...
# Found jellyfish v1.1.11
# Hash size not specified, using '11639921252'
# K-mer set created. [25m41.147s]
# Skipping step 2, no database reduction requested.
# Sorting k-mer set (step 3 of 6)...
# K-mer set sorted. [1h37m24.863s]
# Creating GI number to seqID map (step 4 of 6)...
# GI number to seqID map created. [3m36.319s]
# Creating seqID to taxID map (step 5 of 6)...
# 217526 sequences mapped to taxa. [1m24.881s]
# Setting LCAs in database (step 6 of 6)...
# Finished processing 217833 sequences
# Database LCAs set. [1h3m28.361s]
# Database construction complete. [Total: 3h11m35.699s]

function error_send_email()
{
    MSG="Error while building Kraken DB: '$1'"
	mailx -s "Kraken DB build error: '$1'" douglas.scofield@ebc.uu.se <<< $MSG
    exit 1
}


[[ $(uname -n) = 'milou-b.uppmax.uu.se' ]] || error_send_email "This is a long multi-core process and must be run on milou-b"

set -e

module load bioinfo-tools
module load Kraken/$K_VERSION

set -x

VERSION=$(date +'%Y%m%d')
K_DB=$K_DB_BASE/$VERSION

cd $K_DB_BASE
mkdir $VERSION || error_send_email "In $K_DB_BASE, new directory '$VERSION' exists, quitting..."

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

