#!/bin/bash

#set -x

RTG_REFS_BASE=/sw/data/RTG
cd $RTG_REFS_BASE
echo "Updating RTG preformatted references in $RTG_REFS_BASE"

# Holds the previously downloaded zip files
D=$RTG_REFS_BASE/downloads
mkdir -p $D

set -e

# define arrays containing preformatted references

SITE=https://s3.amazonaws.com/rtg-datasets/references

human=(
1000g_v37_phase2.sdf.zip
hg19.sdf.zip
GRCh38.sdf.zip
GRCh38_hs38d1.sdf.zip
)
        
metagenomics=(
metagenomics/references-filter-2013-02-13.zip
metagenomics/references-protein-2013-02-13.zip
metagenomics/references-species-2013-02-13.zip
)

function fetch_reference() {
    REMOTE=$SITE/$1
    LOCAL=${1##*/}
    SUBDIR=$2
    EXPAND=yes # default
    cd $RTG_REFS_BASE
    mkdir -p $SUBDIR
    cd $SUBDIR
    echo "fetching $SUBDIR reference ${LOCAL} ... "
    if test -f $D/${LOCAL} ; then
        NEW=${LOCAL}.new
        wget --quiet -O $NEW $REMOTE
        if diff $D/$LOCAL $NEW ; then
            echo "no new content in $SUBDIR reference ${LOCAL}"
            rm -f $NEW
            EXPAND=
        else
            echo "found update for $SUBDIR reference ${LOCAL}"
            mv -f $NEW ${LOCAL}
        fi
    else 
        echo -n "found new $SUBDIR reference ${LOCAL}, downloading ... "
        wget --quiet -O $LOCAL $REMOTE
    fi
    if [[ "$EXPAND" ]] ; then
        echo -n "expanding $SUBDIR ${LOCAL} ... "
        unzip -o ${LOCAL}
        mv -f ${LOCAL} $D/${LOCAL}
    else
        echo -n "touching $D/${LOCAL}_checked ... "
        touch $D/${LOCAL}_checked
    fi
    echo done
    echo
}

for REF in ${human[@]}
do
    fetch_reference ${REF} human
done

for REF in ${metagenomics[@]}
do
    fetch_reference ${REF} metagenomics
done

echo "Updating groups and permissions ..."
chgrp -hR sw *
chmod -R u+rwX,g+rwX,o+rX-w *
find . -type d -print0 | xargs -0 chmod g+s

