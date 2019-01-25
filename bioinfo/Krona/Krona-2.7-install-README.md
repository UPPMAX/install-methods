Krona 2.7
=========

<https://github.com/marbl/Krona>

LOG
---

    TOOL=/sw/apps/bioinfo/Krona
    VERSION=2.7
    C=milou
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $C src
    cd $C
    PFX=$PWD
    cd ../..
    mkdir taxonomy
    PFXTAX=$PWD/taxonomy
    cd $VERSION/src/
    [[ -f KronaTools-${VERSION}.tar ]] || wget https://github.com/marbl/Krona/releases/download/v${VERSION}/KronaTools-${VERSION}.tar
    tar xf KronaTools-${VERSION}.tar 
    mv KronaTools-${VERSION} $PFX/
    cd $PFX/KronaTools-${VERSION}/
    ./install.pl --prefix $PFX --taxonomy $PFXTAX

If on milou, update the symlinks in `$PFX` and `KronaTools-${VERSION}/taxonomy` to remove the top-level `/pica`.

    D=$(readlink taxonomy);D=${D#/pica}; ln -sf $D taxonomy
    cd $PFX
    for F in * ; do D=$(readlink $F);D=${D#/pica}; ln -sf $D $F; done


Update the taxonomy and accessions using the local UPPMAX copies of the NCBI
databases.  The text for this script is included below.

    ../../../updateTaxonomy_for_uppmax.sh

Make sure the mf file loads perl/5.18.4 and KRONA_TAXONOMY and KRONA_UPDATE in
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
nucl_est.accession2taxid.gz
nucl_gb.accession2taxid.gz
nucl_gss.accession2taxid.gz
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
