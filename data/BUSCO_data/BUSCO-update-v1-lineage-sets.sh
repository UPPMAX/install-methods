#!/bin/bash

BLS_BASE=/sw/data/BUSCO_data/latest/rackham/v1_lineage_sets

WGET_OPTIONS="--quiet --timestamping"
echo "Updating lineage sets in $BLS_BASE"
cd $BLS_BASE

#set -x
set -e

function fetch_lineage_set() {
    LS=$1
    EXPAND=yes # default
    echo -n "Fetching lineage set ${LS} ... "
    if test -f ${LS} ; then
        NEW=${LS}.new
        wget $WGET_OPTIONS -O $NEW http://busco.ezlab.org/v1/files/${LS}
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
        wget $WGET_OPTIONS http://busco.ezlab.org/v1/files/${LS}
    fi
    if [[ "$EXPAND" ]] ; then
        echo -n " Expanding ... "
        tar xzf ${LS}
    else
        echo -n " Touching ${LS}_checked ... "
        touch ${LS}_checked
    fi
    echo "done."
}

#for LS in plant_early_release.tar.gz
for LS in arthropoda_buscos.tar.gz vertebrata_buscos.tar.gz fungi_buscos.tar.gz bacteria_buscos.tar.gz metazoa_buscos.tar.gz eukaryota_buscos.tar.gz plant_early_release.tar.gz
do
    fetch_lineage_set ${LS}

    # special behaviour for plant early release, there is a subarchive that needs to be unpacked and lifted
    if [[ "${LS}" = "plant_early_release.tar.gz" && "$EXPAND" ]] ; then
        echo -n "Expanding subarchive plantae.tar.gz ... "
        cd plant_early_release
        tar xzf plantae.tar.gz
        mv -f plantae ..
        cd ..
        echo "completed fetching plant early release, unpacked and moved to plantae/"
    fi

done

echo "Updating groups and permissions ..."
chgrp -hR sw *
chmod -R u+rwX,g+rwX,o+rX-w *
find . -type d -exec chmod g+s {} \;
echo "Done."
