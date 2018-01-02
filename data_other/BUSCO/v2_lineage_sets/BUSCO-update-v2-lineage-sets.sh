#!/bin/bash

BLS_BASE=/sw/apps/bioinfo/BUSCO/v2_lineage_sets
WGET_OPTIONS="--quiet --timestamping"
echo "Updating lineage sets in $BLS_BASE"
cd $BLS_BASE

#set -x
set -e

# define arrays containing lineage sets

Bacteria=(
bacteria_odb9.tar.gz
proteobacteria_odb9.tar.gz
rhizobiales_odb9.tar.gz
betaproteobacteria_odb9.tar.gz
gammaproteobacteria_odb9.tar.gz
enterobacteriales_odb9.tar.gz
deltaepsilonsub_odb9.tar.gz
actinobacteria_odb9.tar.gz
cyanobacteria_odb9.tar.gz
firmicutes_odb9.tar.gz
clostridia_odb9.tar.gz
lactobacillales_odb9.tar.gz
bacillales_odb9.tar.gz
bacteroidetes_odb9.tar.gz
spirochaetes_odb9.tar.gz
tenericutes_odb9.tar.gz
)
        
Eukaryota=(
eukaryota_odb9.tar.gz
fungi_odb9.tar.gz
microsporidia_odb9.tar.gz
dikarya_odb9.tar.gz
ascomycota_odb9.tar.gz
pezizomycotina_odb9.tar.gz
eurotiomycetes_odb9.tar.gz
sordariomyceta_odb9.tar.gz
saccharomyceta_odb9.tar.gz
saccharomycetales_odb9.tar.gz
basidiomycota_odb9.tar.gz
metazoa_odb9.tar.gz
nematoda_odb9.tar.gz
arthropoda_odb9.tar.gz
insecta_odb9.tar.gz
endopterygota_odb9.tar.gz
hymenoptera_odb9.tar.gz
diptera_odb9.tar.gz
vertebrata_odb9.tar.gz
actinopterygii_odb9.tar.gz
tetrapoda_odb9.tar.gz
aves_odb9.tar.gz
mammalia_odb9.tar.gz
euarchontoglires_odb9.tar.gz
laurasiatheria_odb9.tar.gz
embryophyta_odb9.tar.gz
protists_ensembl.tar.gz
alveolata_stramenophiles_ensembl.tar.gz
)

SITE=http://busco.ezlab.org/v2/datasets

function fetch_lineage_set() {
    LS=$1
    EXPAND=yes # default
    echo "fetching lineage set ${LS} ... "
    if test -f ${LS} ; then
        NEW=${LS}.new
        wget $WGET_OPTIONS -O $NEW $SITE/${LS}
        if diff ${LS} $NEW ; then
            echo "no new content in lineage set ${LS}"
            echo
            rm -f $NEW
            EXPAND=
        else
            echo "found update for lineage set ${LS}"
            echo
            mv -f $NEW ${LS}
        fi
    else 
        echo "found new lineage set ${LS}"
        echo
        wget $WGET_OPTIONS $SITE/${LS}
    fi
    if [[ "$EXPAND" ]] ; then
        echo "expanding ${LS} ... "
        tar xzf ${LS}
    else
        echo "touching ${LS}_checked ... "
        touch ${LS}_checked
    fi
    echo
}

for LS in ${Bacteria[@]}
do
    fetch_lineage_set ${LS}
done

for LS in ${Eukaryota[@]}
do
    fetch_lineage_set ${LS}
done

echo "Updating groups and permissions ..."
chgrp -hR sw *
chmod -R u+rwX,g+rwX,o+rX-w *
find . -type d -exec chmod g+s {} \;

