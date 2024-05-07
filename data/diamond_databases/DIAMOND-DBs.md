Databases for the DIAMOND Protein Aligner
=========================================

The [iDIAMOND protein aligner](http://www.nature.com/nmeth/journal/v12/n1/full/nmeth.3176.html) is a recent tool offering much faster (100&times; to 1000&times; faster than Blast) alignment of protein sequences against reference databases.  On UPPMAX, DIAMOND is available by loading the `diamond` module, the most recent installed version of which which as of this writing is `diamond/2.0.14`.

As for [BLAST databases](https://www.uppmax.uu.se/blast-databases), UPPMAX provides several pre-built databases suitable for direct usage with the `--db` flag to `diamond`, as well as runs `diamond prepdb` on each of its downloaded BLAST protein databases whenever they are installed.  The BLAST databases are updated according to the schedule given on their webpage.  The `diamond`-format NCBI protein databases are updated once a month.

For each of the databases listed below, the method of versioning is indicated.  To determine the version at UPPMAX, check the path given below after removing the database name from the last position; `latest` is a symbolic link that points to a directory with a name equivalent to the version of the most recent update.  Old database versions will be removed after updates, so please use `latest` rather than directly addressing a database version.

Each of the database locations below is also available in the indicated environment variable set when any version of the diamond module is loaded. These are simple to use, for example to search nr:

    diamond --db $DIAMOND_NR ...


NCBI BLAST Protein Databases
----------------------------

Whenever the BLAST databases are updated and installed, `diamond prepdb` is run
on each of the protein-format databases so that they can be searched directly
by `diamond`.  See the BLAST databases webpage for a description of these.

To search any of them using `diamond`, load the
**blast_databases/latest** module.  This defines the environment variable
`BLASTDB`, which contains the directory holding these databases.
Once this module is loaded, you can run `diamond` on any of the protein databases.
For example:

    diamond --db $BLASTDB/nr ...

    diamond --db $BLASTDB/cdd_delta ...

    diamond --db $BLASTDB/swissprot ...

    diamond --db $BLASTDB/pdbaa ...

According to DIAMOND's developer, these are faster to load than DIAMOND's own `.dmnd`-format databases.
So, you may want to load the `blast_databases/latest` data module and use `--db $BLASTDB/nr` for your NCBI nr searches, for example, instead of `--db $DIAMOND_NR`.


Diamond-format NCBI Protein Databases
-------------------------------------

Downloaded from <ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA>.  These are updated
frequently at NCBI, so they are versioned here by the monthly download date.
There is no longer a separate FASTA version of **env_nr**, so its Blast
database is downloaded from <ftp://ftp.ncbi.nlm.nih.gov/blast/db> and FASTA
sequences are extracted using `blastdbcmd -entry all` from module
`blast/2.12.0+`.

Database      | Environment variable for `diamond --db` | UPPMAX path
--------------|-----------------------------------------|-----------------------------
**nr**        | DIAMOND_NR                              | /sw/data/diamond_databases/Blast/latest/nr
**env_nr**    | DIAMOND_ENV_NR                          | /sw/data/diamond_databases/Blast/latest/env_nr
**swissprot** | DIAMOND_SWISSPROT                       | /sw/data/diamond_databases/Blast/latest/swissprot
**pdbaa**     | DIAMOND_PDBAA                           | /sw/data/diamond_databases/Blast/latest/pdbaa



NCBI RefSeq Proteins
---------------------

RefSeq protein databases are downloaded from
<ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete/>, with an update occurring
if there is a new release as indicated by the contents of
<ftp://ftp.ncbi.nlm.nih.gov/refseq/release/RELEASE_NUMBER>.

Database                                  | Environment variable for `diamond --db`         | UPPMAX path
------------------------------------------|-------------------------------------------------|-----------------------------
**complete.nonredundant_protein.protein** | DIAMOND_REFSEQ_NONREDUNDANT                     | /sw/data/diamond_databases/RefSeq/latest/complete.nonredundant_protein.protein
**complete.protein**                      | DIAMOND_REFSEQ                                  | /sw/data/diamond_databases/RefSeq/latest/complete.protein



UniRef90
--------

The UniRef90 protein database is downloaded as Fasta from its UK mirror at
<ftp://ftp.expasy.org/databases/uniprot/current_release/uniref/uniref90/>, with
an update occurring if there is a new version as indicated by the `<version>`
tag in the XML description available at
<ftp://ftp.expasy.org/databases/uniprot/current_release/uniref/uniref90/RELEASE.metalink>.

Database      | Environment variable for `diamond --db` | UPPMAX path
--------------|-----------------------------------------|-----------------------------
**uniref90**  | DIAMOND_UNIREF90                        | /sw/data/diamond_databases/UniRef90/latest/uniref90




UniProt Reference Proteomes
----------------------------

The UniProt Reference Proteomes protein database is downloaded as Fasta from its UK mirror at
<ftp://ftp.expasy.org/databases/uniprot/current_release/knowledgebase/reference_proteomes>, with
an update occurring if there is a new version as indicated by the `<version>`
tag in the XML description available at
<ftp://ftp.expasy.org/databases/uniprot/current_release/knowledgebase/reference_proteomes/RELEASE.metalink>.
If there is a new release, then the file `Reference_Proteomes_RELEASE.tar.gz` is downladed, with `RELEASE` replaced by the release number.
The `reference_proteomes.dmnd` database is created from this file using the protocol described after the table.


Database                         | Environment variable for `diamond --db` | UPPMAX path
---------------------------------|-----------------------------------------|-----------------------------
**UniProt Reference Proteomes**  | DIAMOND_REFERENCE_PROTEOMES             | /sw/data/diamond_databases/reference_proteomes/latest/reference_proteomes


The `reference_proteomes.dmnd` database is created using the following protocol for the <a href="https://blobtoolkit.genomehubs.org/install/">BlobToolKit</a>.
This uses UPPMAX's most recently downloaded NCBI taxonomy database for its taxonomic metadata.

    module load bioinfo-tools
    module load diamond/2.0.14
    module load ncbi_taxonomy/latest

    # after downloading
    tar xf Reference_Proteomes_RELEASE.tar.gz
    touch reference_proteomes.fasta.gz
    find . -mindepth 2 | grep "fasta.gz" | grep -v 'DNA' | grep -v 'additional' | xargs cat >> reference_proteomes.fasta.gz
    printf "accession\taccession.version\ttaxid\tgi\n" > reference_proteomes.taxid_map
    zcat */*/*.idmapping.gz | grep "NCBI_TaxID" | awk '{print $1 "\t" $1 "\t" $3 "\t" 0}' >> reference_proteomes.taxid_map

    diamond makedb --db reference_proteomes.dmnd --in reference_proteomes.fasta.gz --threads 10 --taxonmap reference_proteomes.taxid_map --taxonnames $NCBI_TAXONOMY_ROOT/names.dmp --taxonnodes $NCBI_TAXONOMY_ROOT/nodes.dmp

