Krona/2.8.1-20211222-d1479b3
============================

<https://github.com/marbl/Krona>

Used under license:


Structure creating script (makeroom_Krona_2.8.1-20211222-d1479b3.sh) moved to /sw/bioinfo/Krona/makeroom_2.8.1-20211222-d1479b3.sh

LOG
---


    makeroom.sh -f -t Krona -s misc -v 2.8.1-20211222-d1479b3 -w https://github.com/marbl/${TOOL} -d "Interactively explore metagenomes and more from a web browser"
    ./makeroom_Krona_2.8.1-20211222-d1479b3.sh 
    source /sw/bioinfo/Krona/SOURCEME_Krona_2.8.1-20211222-d1479b3

    cd $TOOLDIR
    mkdir -p taxonomy
    PREFIXTAX=$TOOLDIR/taxonomy

We have to install from the github repository, some scripts are missing and there's a useful-looking option that's been added.

    cd $SRCDIR
    ml perl/5.26.2
    ml git/2.34.1
    git clone https://github.com/marbl/Krona
    cd Krona/
    git reset --hard d1479b3
    cp -av KronaTools $PREFIX/
    cd $PREFIX/
    cd KronaTools

    ./install.pl --prefix $PREFIX --taxonomy $PREFIXTAX

Update the taxonomy and accessions using the local UPPMAX copies of the NCBI
databases.  The text for this script is included below.

    ../../../updateTaxonomy_for_uppmax.sh

Make sure the mf file loads perl/5.26.2 and KRONA_TAXONOMY and KRONA_UPDATE in
case a user wants to make their own taxonomy and accession databases.

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
