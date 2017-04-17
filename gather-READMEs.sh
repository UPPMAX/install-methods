#!/bin/bash

set -x
set -e

REPOSITORY='/home/douglas/github-sync/local/uppmax/install-methods'

# modules

cd /sw

find apps -name '*install-README.md' | cpio -pdm $REPOSITORY
find libs -name '*install-README.md' | cpio -pdm $REPOSITORY
find comp -name '*install-README.md' | cpio -pdm $REPOSITORY

# databases

DATA_REPOSITORY="$REPOSITORY/data_uppnex"

mkdir -p $DATA_REPOSITORY

cd /sw/data/uppnex

find ExAC -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find Kraken -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
find Pfam -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find SGDP -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find annotations -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find blast_databases -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
find cdd -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find chembl -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
find dbCAN -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find diamond_databases -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find igenomes -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find piper_references -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find pph2-db -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find reference -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find silva -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY
# find vep -name '*install-README.md' | cpio -pdm $DATA_REPOSITORY

