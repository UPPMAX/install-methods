#!/bin/bash

set -x

# Remove the old database created during installation by install_blastdb.sh

INSTALL=/sw/data/uppnex/blast_databases
OLD=${INSTALL}_old

[[ -e $INSTALL ]] || { echo "$0: something wrong, $INSTALL does not exist"; exit 1; }

[[ -e $OLD ]] && { echo "$0: removing $OLD"; rm -vrf $OLD; }

echo -e "$0: Removed $OLD\n" | mailx -s "old blast databases removed" douglas.scofield@ebc.uu.se

