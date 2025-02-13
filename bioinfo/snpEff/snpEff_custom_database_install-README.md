Installing a custon snpEff database
===================================

To install a custom database, for example c_elegans.PRJNA13758.WS283 or canFam4.0, to (for example) snpEff/5.2

Guide at <http://pcingola.github.io/SnpEff/se_buildingdb/#option-1-building-a-database-from-gtf-files>

First install a single database.

    module load bioinfo-tools snpEff/5.2

    snpEff download -v Sscrofa11.1.105


Betavulgaris_EL10.2_2
---------------------

Download genome and annotations from Phytozome v13.  The cds.fa and proteins.fa files cause failed checks, so build with -noCheckCds and -noCheckProteins.

    snpEff build -gff3 -noCheckCds -noCheckProtein -v Betavulgaris_EL10.2_2 2>&1 | tee data/Betavulgaris_EL10.2_2/database.build.out


canFam4.0
---------

    cd /sw/bioinfo/snpEff/5.2/rackham/data
    mkdir canFam4.0
    cd  canFam4.0

Now add data here. Genome:

    cp ....../cf4.b6.14.fa .

Gene annotations:

    cp ....../GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.NameB614.gtf .

Rename files:

    mv GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.NameB614.gtf genes.gtf
    mv cf4.b6.14.fa canFam4.0.fa
    ln -s canFam4.0.fa sequences.fa

Now add an entry to snpeff.config for this:

    cd /sw/bioinfo/snpEff/5.2/rackham/

Add this line in the list of genomes in the main snpEff.config:

    canFam4.0.genome : Canis_familiaris

And, build the database:

    module load bioinfo-tools snpEff/5.2

    java -jar $SNPEFF_ROOT/snpEff.jar build -gtf22 -v canFam4.0 2>&1 | tee /sw/bioinfo/snpEff/5.2/rackham/data/canFam4.0/database.build.out



c_elegans.PRJNA13758.WS283
--------------------------

This one requires specifying the codon table for the mitochondrion.

    cd /sw/bioinfo/snpEff/5.2/rackham/data/
    mkdir c_elegans.PRJNA13758.WS283
    cd c_elegans.PRJNA13758.WS283

Fill with genome and gene annotations

    c_elegans.PRJNA13758.WS283.fa
    genes.gff3

Symlinks for genome and GFF.

    ln -s c_elegans.PRJNA13758.WS283.fa sequences.fa
    ln -s genes.gff3 genes.gff

Add these lines in the list of genomes in the main snpEff.config:

    c_elegans.PRJNA13758.WS283.genome : Caenorhabditis_elegans
    c_elegans.PRJNA13758.WS283.MtDNA.codonTable : Invertebrate_Mitochondrial

Note that advice from Katju lab is that we do *not* use Alternative_Flatworm_Mitochondrial for the MtDNA.codonTable.

And, build the database:

    module load bioinfo-tools snpEff/5.2

    snpEff build -gff3 -v c_elegans.PRJNA13758.WS283 2>&1 | tee /sw/bioinfo/snpEff/5.2/rackham/data/c_elegans.PRJNA13758.WS283/database.build.out

This results in the database, and the output log:

    -rw-rw-r-- 1 douglas sw  363567099 Nov 28 17:13 snpEffectPredictor.bin

    -rw-rw-r-- 1 douglas sw   11693715 Nov 28 17:13 database.build.out

