snpEff/5.1
========================

<https://pcingola.github.io/SnpEff>

Used under license:
MIT
<https://pcingola.github.io/SnpEff/license/>

Structure creating script (makeroom_snpEff_5.1.sh) moved to /sw/bioinfo/snpEff/makeroom_5.1.sh

LOG
---

    makeroom.sh -f -t snpEff -v 5.1 -w https://pcingola.github.io/SnpEff -d "Genomic variant annotations and functional effect prediction toolbox" -l MIT -L "https://pcingola.github.io/SnpEff/license/"
    ./makeroom_snpEff_5.1.sh 
    source /sw/bioinfo/snpEff/SOURCEME_snpEff_5.1 && cd $SRCDIR
    wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip
    unzip -q snpEff_latest_core.zip 
    cd snpEff/
    mv * $PREFIX/
    cd ..
    rmdir snpEff/



1. Fetch and unpack zip file directly to $version folder and rename to $Cluster
2. Make symbolic links to other clusters (it's just java)
3. Create "data" folder within $Cluster
4. Set group for $version to "sw", recursively (eg, "chgrp -R sw 4.1")
5. Fix jardir variable in $Cluster/scripts/snpEff as follows (see RT #109289):

    # jardir="$(cd "$(dirname "$0")" && pwd -P)"
    jardir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."


Local databases
---------------

Install these first!

    # Katju lab request WS283
    c_elegans.PRJNA13758.WS283.genome : Caenorhabditis_elegans
    #  c_elegans.PRJNA13758.WS283.MtDNA.codonTable : Alternative_Flatworm_Mitochondrial
    c_elegans.PRJNA13758.WS283.MtDNA.codonTable : Invertebrate_Mitochondrial

    # Sophie Agger wanted the Canis familiaris v4 genome
    canFam4.0.genome : Canis_familiaris

    # Ficedula albicollis genome ENSEMBLE 73 release, Ellegren lab in-house
    fAlb15.e73.genome : Ficedula_albicollis

Created `$PREFIX/data/databases_list.custom` from these descriptions.

Databases
---------

    module load snpEff/5.1
    cd $SNPEFF_ROOT/data
    java -jar $SNPEFF_ROOT/snpEff.jar databases > database_list

Get database download names, removing the local names.

    tail -n +3 databases_list | grep -P -v '(c_elegans.PRJNA13758.WS283|canFam4.0|fAlb15.e73)' | cut -f1 | sed 's/\s\+$//' > downloads_list
    for G in $(cat downloads_list) ; do
        java -jar $SNPEFF_ROOT/snpEff.jar download -v "$G" 
    done 2>&1 | tee downloads_list.log

This required many redownloads, creating a smaller downloads_list.continue each time.

    for G in $(cat downloads_list.continue) ; do java -jar $SNPEFF_ROOT/snpEff.jar download -v "$G" ; done 2>&1 | tee -a downloads_list.log

After all are installed, generate the new list with

    java -jar $SNPEFF_ROOT/snpEff.jar databases > database_list

Note that some of these now have OK for status, showing they are installed.

Generate the list of installed databases with

    cd $SNPEFF_ROOT/data
    cat databases_list.custom databases_list > databases_list.installed

This file is referred to in the mf file.
