#!/bin/bash

BASE=/sw/data/CTAT_RESOURCE_LIB
WGET_OPTIONS="--quiet --timestamping"
mkdir -p $BASE
cd $BASE

[[ $1 == "-h" || $1 == "--help" ]] && { echo "$0: downloads data files, currently supporting 2020-04 2021-03. These will not be downloaded if they already exist. Older versions 2017-11 2018-02 2019-03 2019-08 are left in place."; exit 1; }

set -e

function fetch_version() {
    # have VERSION, SITE and Files set before calling this
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    echo "$VERSION: Fetching data files from ${SITE} ..."
    for F in ${Files[@]}
    do
        fetch_data ${F}
    done
    mv *.plug-n-play.tar.gz* src/ 2>/dev/null || echo "$VERSION: no new files to move to src/"
    cd ..
}

function fetch_data() {
    # arg-1 is the file to fetch; SITE must already be defined as the base of the URL from which to fetch arg-1
    # arg-1 is assumed to have an arg-1.md5 or arg-1.md5sum file available at the same site; this is always checked with md5sum -c
    # if either of these files (arg-1 or arg-1.md5) already exists locally, it is not fetched
    D=$1
    M=${D}.md5
    MS=${D}.md5sum
    EXPAND=yes  # default is to expand tarballs
    [[ -f src/$D && -f src/$M ]] && { echo "$D is already downloaded, checked and set up."; return; }
    echo -n "Fetching data ${D} ... "
    [[ -f ${D} ]] && echo -n "Already fetched. " || { wget $WGET_OPTIONS $SITE/${D}; echo -n "Fetched. "; }
    echo -n "Fetching its MD5 file ... "
    [[ -f ${M} || -f ${MS} ]] && echo -n "Already fetched. " || { wget $WGET_OPTIONS $SITE/${M} || wget $WGET_OPTIONS $SITE/${MS}; echo -n "Fetched. "; }
    [[ -f ${MS} ]] && M=$MS
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

#VERSION=2017-11
#SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_pre-StarFv1.3
#Files=(
#GRCh37_gencode_v19_CTAT_lib_Nov012017.plug-n-play.tar.gz
#GRCh38_gencode_v26_CTAT_lib_Nov012017.plug-n-play.tar.gz
#Mouse_M15_CTAT_lib_Nov012017.plug-n-play.tar.gz
#)
#
#fetch_version


#  For STAR-fusion 1.3 to 1.5

#VERSION=2018-02
#SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.3/
#Files=(
#GRCh37_v19_CTAT_lib_Feb092018.plug-n-play.tar.gz
#GRCh38_v27_CTAT_lib_Feb092018.plug-n-play.tar.gz
#Mouse_M16_CTAT_lib_Feb202018.plug-n-play.tar.gz
#)
#
#fetch_version


#  For STAR-fusion 1.6, not currently installed at Uppmax but data are available nonetheless

#VERSION=2019-03
#SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.6/
#Files=(
#GRCh37_gencode_v19_CTAT_lib_Mar272019.plug-n-play.tar.gz
#GRCh38_gencode_v29_CTAT_lib_Mar272019.plug-n-play.tar.gz
#Mouse_gencode_M20_CTAT_lib_Mar272019.plug-n-play.tar.gz
#)
#
#fetch_version


#  For STAR-fusion 1.7

#VERSION=2019-08
#SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.7/
#Files=(
#GRCh37_gencode_v19_CTAT_lib_Aug152019.plug-n-play.tar.gz
#GRCh38_gencode_v31_CTAT_lib_Aug152019.plug-n-play.tar.gz
#Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz
#)
#
#fetch_version


#  For STAR-fusion 1.9

VERSION=2020-04
SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.9/
Files=(
GRCh37_gencode_v19_CTAT_lib_Apr032020.plug-n-play.tar.gz
GRCh38_gencode_v22_CTAT_lib_Apr032020.plug-n-play.tar.gz
GRCh38_gencode_v33_CTAT_lib_Apr062020.plug-n-play.tar.gz
Mouse_gencode_M24_CTAT_lib_Apr062020.plug-n-play.tar.gz
)

fetch_version



#  For STAR-fusion 1.10

VERSION=2021-03
SITE=https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.10/
Files=(
GRCh37_gencode_v19_CTAT_lib_Mar012021.plug-n-play.tar.gz
GRCh38_gencode_v22_CTAT_lib_Mar012021.plug-n-play.tar.gz
GRCh38_gencode_v37_CTAT_lib_Mar012021.plug-n-play.tar.gz
)

fetch_version




#  wrapping up

echo "Updating groups and permissions ..."
chgrp -hR sw *
chmod -R u+rwX,g+rwX,o+rX-w *
find . -type d -exec chmod g+s {} \;

