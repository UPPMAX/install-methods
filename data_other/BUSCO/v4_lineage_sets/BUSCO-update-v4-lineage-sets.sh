#!/bin/bash

BLS_BASE=/sw/bioinfo/BUSCO/v4_lineage_sets
SITE=https://busco-data.ezlab.org/v4/data/
WGET_OPTIONS="--quiet --timestamping"
echo "Updating lineage sets in $BLS_BASE"

cd $BLS_BASE
#set -x
set -e

module load gnuparallel/20180822

#DRY_RUN="--dry-run"  # set to this to dry-run the parallel processes
DRY_RUN=


# Download the lineages_list to specify which files to download
LINELISTFILE=$(curl -s ${SITE}/information/  | grep lineages_list | cut -d'"' -f2)
wget ${WGET_OPTIONS} ${SITE}/information/${LINELISTFILE}
tar xf ${LINELISTFILE}


# Define arrays containing lineage sets
LINELIST=$(cat ${LINELISTFILE%.tar.*}  | sed '/^\S/d' | sed 's/ //g' | sed 's/^-//' | sed '/^$/d')

function fetch_lineage_set() {
    LINEAGE=$1
    LS=$(curl -s $SITE/lineages/ | grep "\"${LINEAGE}\." | cut -d'"' -f2)
    EXPAND=yes # default
    SUBEXPAND=yes # expand refseq_db.faa.gz within lineage set
    echo -ne "Fetching lineage set ${LS} ... \t"
    if test -f ${LS} ; then
        NEW=${LS}.new
        wget $WGET_OPTIONS -O $NEW $SITE/lineages/${LS}
        if diff ${LS} $NEW ; then
            echo -n "no new content."
            rm -f $NEW
            EXPAND=
        else
            echo -n "found update!"
            mv -f $NEW ${LS}
        fi
    else 
        echo -n "this is a new lineage set."
        wget $WGET_OPTIONS $SITE/lineages/${LS}
    fi
    if [[ "$EXPAND" ]] ; then
        echo -n " Expanding ... "
        tar xf ${LS}
        if [[ "$SUBEXPAND" ]] ; then
            ( cd ${LINEAGE} && [[ -f refseq_db.faa.gz ]] && echo -n " Subexpanding ... " && gunzip refseq_db.faa.gz )
        fi
    else
        echo -n " Touching ${LS}_checked ... "
        touch ${LS}_checked
    fi
    echo "done."
}

# Loop over every species and update if necessary 
cd $BLS_BASE/lineages/

for LS in ${LINELIST}
do
    fetch_lineage_set ${LS}
done


echo "Updating groups and permissions ..."
#chgrp -hR sw *
#chmod -R u+rwX,g+rwX,o+rX-w *
#find . -type d -exec chmod g+s {} \;

# lineages/ and everything in it, which takes a long time
chmod u+rwX,g+rwX,o+rX-w .
chmod g+s .
parallel --verbose $DRY_RUN -j 4 /sw/data/blast_scripts/fixup ::: *
# everything else
cd $BLS_BASE
parallel --verbose $DRY_RUN -j 4 /sw/data/blast_scripts/fixup ::: *.sh *.tsv information lineages_list* placement_files
echo "Done."
