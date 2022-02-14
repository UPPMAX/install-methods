#!/bin/bash

BLS_BASE=/sw/bioinfo/BUSCO/v5_lineage_sets
SITE=https://busco-data.ezlab.org/v5/data/
WGET_OPTIONS="--quiet --timestamping"
echo "Updating lineage sets in $BLS_BASE"

cd $BLS_BASE
#set -x
set -e

module load gnuparallel/20180822


# Download the lineages_list to specify which files to download
LINELISTFILES=$(curl -s ${SITE}/information/  | grep tar.gz | cut -d'"' -f2)
for file in $LINELISTFILES; do
    wget ${WGET_OPTIONS} ${SITE}/information/${file}
    tar xfv ${file}
    rm ${file}
done

# Define arrays containing lineage sets. New for v5 is the virus datasets. It isn't indented as the lineages file...
LINELIST=$(cat lineages_list*  | sed '/^\S/d' | sed 's/ //g' | sed 's/^-//' | sed '/^$/d')
LINELIST="${LINELIST} $(cat virus_datasets*)"
LINELIST=$(echo $LINELIST | tr ' ' '\n' | sort -uV)  # sort the lineage list now before fetching them
echo $LINELIST

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
cd $BLS_BASE/lineages/
#chgrp -hR sw *
#chmod -R u+rwX,g+rwX,o+rX-w *
#find . -type d -exec chmod g+s {} \;

# lineages/ and everything in it, which takes a long time
chmod u+rwX,g+rwX,o+rX-w .
chmod g+s .
parallel --verbose -j 4 fixup {}'*' ::: $LINELIST

# everything else
cd $BLS_BASE
parallel --verbose -j 4 fixup ::: *.sh *.tsv information lineages_list.* placement_files virus_datasets.*
echo "Done."
