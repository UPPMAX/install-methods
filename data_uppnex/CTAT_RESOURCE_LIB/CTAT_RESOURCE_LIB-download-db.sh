#!/bin/bash

BASE=/sw/data/uppnex/CTAT_RESOURCE_LIB
WGET_OPTIONS="--quiet --timestamping"
mkdir -p $BASE
cd $BASE

set -e

function fetch_data() {
    # arg-1 is the file to fetch; SITE must already be defined as the base of the URL from which to fetch arg-1
    # arg-1 is assumed to have an arg-1.md5 file available at the same site; this is always checked with md5sum -c
    # if either of these files (arg-1 or arg-1.md5) already exists locally, it is not fetched
    D=$1
    M=${D}.md5
    EXPAND=yes  # default is to expand tarballs
    echo -n "Fetching data ${D} ... "
    [[ -f ${D} ]] && echo -n "Already fetched. " || { wget $WGET_OPTIONS $SITE/${D}; echo -n "Fetched. "; }
    echo -n "Fetching its MD5 file ... "
    [[ -f ${M} ]] && echo -n "Already fetched. " || { wget $WGET_OPTIONS $SITE/${M}; echo -n "Fetched. "; }
    echo -n "Checking MD5 ... "
    if md5sum -c ${M} ; then
        if [[ "$EXPAND" ]] ; then
            echo -n "Expanding ... "
            tar xzf ${D}
        else
            echo -n "Touching ${D}_checked ... "
            touch ${D}_checked
        fi
    else 
        echo -n "*** FAILED MD5 check *** "
        touch ${D}_FAILED_MD5
    fi
    echo "Done."
}

#  Earlier version, for pre-1.3 versions of STAR-fusion

mkdir -p 2017-11
cd 2017-11
mkdir -p src
SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_pre-StarFv1.3

Files=(
GRCh37_gencode_v19_CTAT_lib_Nov012017.plug-n-play.tar.gz
GRCh38_gencode_v26_CTAT_lib_Nov012017.plug-n-play.tar.gz
Mouse_M15_CTAT_lib_Nov012017.plug-n-play.tar.gz
)

echo "Fetching data files from ${SITE} ..."
for F in ${Files[@]}
do
    fetch_data ${F}
done

mv *.plug-n-play.tar.gz* src/
cd ..


#  The most recent version, for STAR-fusion 1.3 and later

mkdir -p 2018-02
cd 2018-02
mkdir -p src
SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB

Files=(
GRCh37_v19_CTAT_lib_Feb092018.plug-n-play.tar.gz
GRCh38_v27_CTAT_lib_Feb092018.plug-n-play.tar.gz
Mouse_M16_CTAT_lib_Feb202018.plug-n-play.tar.gz
)

echo "Fetching data files from ${SITE} ..."
for F in ${Files[@]}
do
    fetch_data ${F}
done

#
mv *.plug-n-play.tar.gz* src/
cd ..

echo "Updating groups and permissions ..."
chgrp -hR sw *
chmod -R u+rwX,g+rwX,o+rX-w *
find . -type d -exec chmod g+s {} \;

