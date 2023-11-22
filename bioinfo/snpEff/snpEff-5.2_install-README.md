snpEff/5.2
==========

<https://pcingola.github.io/SnpEff>

Used under license:
MIT
<https://pcingola.github.io/SnpEff/license/>

Structure creating script (makeroom_snpEff_5.2.sh) moved to /sw/bioinfo/snpEff/makeroom_5.2.sh

LOG
---

    makeroom.sh -f -t snpEff -v 5.2 -w https://pcingola.github.io/SnpEff -d "Genomic variant annotations and functional effect prediction toolbox" -l MIT -L "https://pcingola.github.io/SnpEff/license/"
    ./makeroom_snpEff_5.2.sh 
    source /sw/bioinfo/snpEff/SOURCEME_snpEff_5.2 && cd $SRCDIR
    wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip
    unzip -q snpEff_latest_core.zip 
    cd snpEff/
    mv * $PREFIX/
    cd ..
    rmdir snpEff/

Adjust the java memory parameters for UPPMAX, see $PREFIX/scripts/snpEff and $PREFIX/scripts/snpSift

Local databases
---------------

Installed Sscrofa11.1.105 to initialise the data/ directory.

    module load bioinfo-tools snpEff/5.2

    snpEff download -v Sscrofa11.1.105

Add these to snpEff.config

    # Katju lab request WS283
    c_elegans.PRJNA13758.WS283.genome : Caenorhabditis_elegans
    #  c_elegans.PRJNA13758.WS283.MtDNA.codonTable : Alternative_Flatworm_Mitochondrial
    c_elegans.PRJNA13758.WS283.MtDNA.codonTable : Invertebrate_Mitochondrial

    # Sophie Agger wanted the Canis familiaris v4 genome
    canFam4.0.genome : Canis_familiaris

    # Ficedula albicollis genome ENSEMBLE 73 release, Ellegren lab in-house
    fAlb15.e73.genome : Ficedula_albicollis

Created `$PREFIX/data/databases_list.custom` from these descriptions.

The install.

    snpEff build -v -noCheckProtein -noCheckCds fAlb15.e73
    snpEff build -v -noCheckProtein -noCheckCds c_elegans.PRJNA13758.WS283
    snpEff build -v -noCheckProtein -noCheckCds canFam4.0



Databases
---------

    module load snpEff/5.2
    cd $SNPEFF_ROOT/data
    snpEff databases > databases_list

Get database download names, removing the local names.

    tail -n +3 databases_list | grep -P -v '(c_elegans.PRJNA13758.WS283|canFam4.0|fAlb15.e73)' | cut -f1 | sed 's/\s\+$//' > downloads_list

    for G in $(cat downloads_list) ; do
        snpEff download -v "$G" 
    done 2>&1 | tee downloads_list.log

This required many redownloads, creating a smaller downloads_list.continue each time.

    snpEff databases > databases_list
    tail -n +3 databases_list | grep -P -v '\tOK ' | cut -f1 | sed 's/\s\+$//' > downloads_list.continue

Download from downloads_list.continue.

    for G in $(cat downloads_list.continue) ; do
        snpEff download -v "$G"
    done 2>&1 | tee -a downloads_list.log

After all are installed, generate the new list with

    cd $SNPEFF_ROOT/data
    snpEff databases > databases_list

Note that some of these now have OK for status, showing they are installed.

Generate the list of installed and missing databases with

    cd $SNPEFF_ROOT/data
    tail -n +3 databases_list | grep -P '\tOK ' > databases_list.installed
    tail -n +3 databases_list | grep -P -v '\tOK ' > databases_list.missing

These files are referred to in the mf file.

