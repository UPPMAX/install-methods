Krona 2.7.1
=========

<https://github.com/marbl/Krona>

LOG
---

    
    TOOL=Krona
    VERSION=2.7.1
    makeroom.sh -f -t ${TOOL} -s misc -v ${VERSION} -w https://github.com/marbl/${TOOL} -d "Interactively explore metagenomes and more from a web browser"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    cd $TOOLDIR
    mkdir -p taxonomy
    PREFIXTAX=$TOOLDIR/taxonomy
    cd src
    [[ -f ${TOOL}Tools-${VERSION}.tar ]] || wget https://github.com/marbl/${TOOL}/releases/download/v${VERSION}/${TOOL}Tools-${VERSION}.tar
    tar xf ${TOOL}Tools-${VERSION}.tar 
    mv ${TOOL}Tools-${VERSION} $PREFIX/
    cd $PREFIX/${TOOL}Tools-${VERSION}/
    ./install.pl --prefix $PREFIX --taxonomy $PREFIXTAX

Update the taxonomy and accessions using the local UPPMAX copies of the NCBI
databases.  The text for this script is included below.

    ../../../updateTaxonomy_for_uppmax.sh

Make sure the mf file loads perl/5.26.2 and KRONA_TAXONOMY and KRONA_UPDATE in
case a user wants to make their own taxonomy and accession databases.  For more
see 'module help Krona/2.7'.

This has the annoying habit of making symlinks over to the source tree.  That is
why we move the unpacked tree under the install tree and install from there.

## updateTaxonomy_for_uppmax.sh

```bash
#! /bin/bash

# run this while in the directory containing the updateTaxonomy.sh script, which also
# contains a taxonomy or symlink to taxonomy directory

CurPath=$PWD
dest=${1:-$PWD/taxonomy}

# local update copy of taxonomy databases
source=/sw/data/uppnex/ncbi_taxonomy
A2T="
dead_nucl.accession2taxid.gz
dead_prot.accession2taxid.gz
dead_wgs.accession2taxid.gz
nucl_gb.accession2taxid.gz
nucl_wgs.accession2taxid.gz
prot.accession2taxid.gz
"
[[ -e $dest ]] || { echo "destination '$dest' must exist"; exit 1; }
cp -av $source/latest/download/taxdump.tar.gz $dest/
mkdir $dest/accession2taxid
for A in $A2T; do
    cp -av $source/latest/accession2taxid/download/$A $dest/accession2taxid/
done

$CurPath/updateTaxonomy.sh --only-build $dest
$CurPath/updateTaxonomy.sh --accessions --only-build $dest
```
Krona/2.7.1
========================

<https://github.com/marbl/Krona>

Used under license:


Structure creating script (makeroom_Krona_2.7.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Krona/makeroom_2.7.1.sh

