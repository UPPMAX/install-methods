Krona 2.7
=========

<https://github.com/marbl/Krona>

LOG
---

    cd /sw/apps/bioinfo/
    mkdir Krona
    cd Krona/
    VERSION=2.7
    mkdir $VERSION
    cd 2.7$VERSION
    mkdir milou src_milou
    cd milou/
    P=$PWD
    cd ../..
    mkdir taxonomy
    PT=$PWD/taxonomy
    cd $VERSION/src_milou/
    wget https://github.com/marbl/Krona/releases/download/v${VERSION}/KronaTools-${VERSION}.tar
    tar xf KronaTools-${VERSION}.tar 
    cd KronaTools-${VERSION}/
    ./install.pl --prefix $P --taxonomy $PT

Update the taxonomy and accessions.  Takes about an hour.

    ./updateTaxonomy.sh 
    ./updateAccessions.sh 

Make sure the mf file loads perl/5.18.4 and KRONA_TAXONOMY and KRONA_UPDATE in
case a user wants to make their own taxonomy and accession databases.  For on
'module help Krona/2.7'.

