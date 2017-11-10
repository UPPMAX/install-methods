#!/bin/bash

set -x

# Install all dbs in these directories to /sw/data/uppnex/blast_databases:
#
# * /sw/data/uppnex/blast_tmp/blastdb/
# * /sw/data/uppnex/blast_tmp/uniprot/blastdb/
#
# No reason this script has to know the databases available, it should just
# install everything found in the above directories; it assumes the update
# scripts know what they are supposed to do
#
# This script will remove the directory of old inactive databases if it exists,
# before moving the current to the old.  But it should already be removed by a cron
# job which runs 24 hours after this one.

STAGED=(/sw/data/uppnex/blast_tmp/blastdb /sw/data/uppnex/blast_tmp/uniprot/blastdb)

INSTALL=/sw/data/uppnex/blast_databases
OLD=${INSTALL}_old
NEW=${INSTALL}_new

[[ -e $INSTALL ]] || { echo "$0: something wrong, $INSTALL does not exist"; exit 1; }

[[ ! -e $NEW ]] || { echo "$0: $NEW already exists"; exit 1; }
mkdir $NEW
chgrp sw $NEW
chmod u+rwX,g+rwsX,o+rX-w $NEW
#chmod g+s $NEW

for S in ${STAGED[@]} ; do
    [[ -d $S ]] || { echo "$0: staged directory $S does not exist"; exit 1; }
    echo "$0: handling databases within $S"
    ## instead of mv, just symlink while testing
    ##( cd $NEW ; ln -svf $S/* . )
    mv -v $S/* $NEW/
done

[[ -e $OLD ]] && { echo "$0: removing $OLD"; rm -vrf $OLD; }

mv -v $INSTALL $OLD

mv -v $NEW $INSTALL

echo -e "$0: Installed blast databases to $INSTALL\n$0: now check on old databases in $OLD\n" | mailx -s "blast databases installed" douglas.scofield@ebc.uu.se

