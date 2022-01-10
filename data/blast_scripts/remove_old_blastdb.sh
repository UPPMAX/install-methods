#!/bin/bash

#set -x

# Remove the old database created during installation by install_blastdb.sh

INSTALL=/sw/data/uppnex/blast_databases
OLD=${INSTALL}_old
#EMAIL="lars.eklund@uppmax.uu.se"
EMAIL="douglas.scofield@uppmax.uu.se"

[[ -e $INSTALL ]] || { echo "$0: something wrong, $INSTALL does not exist"; exit 1; }

[[ -e $OLD ]] && { echo -e "$0: removing $OLD ..."; rm -rf $OLD; }

echo -e "$0: Removed $OLD\n" | mailx -s "$0: completed" "$EMAIL"

