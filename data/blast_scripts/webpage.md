Many pipelines involving annotation/assembly comparison involve Blast
(<https://blast.ncbi.nlm.nih.gov/Blast.cgi>). Several Blast versions are available
as modules, for example:

  * **blast/2.12.0+**, etc. : the Blast+ suites (`blastp`, `tblastn`, etc.), **recommended**
  * **blast/2.2.26**, etc. : 'legacy' Blast (`blastall`, `megablast`, etc)

Use `module spider blast` to see available versions.  As for all bioinformatics
tools at Uppmax, `module load bioinfo-tools` is required before the blast
modules are available.

Uppmax maintains local copies of many Blast databases, including many
available at NCBI:

  * <ftp://ftp.ncbi.nih.gov/blast/db/README>
  * <ftp://ftp.ncbi.nlm.nih.gov/blast/documents/blastdb.html>
  * <https://www.ncbi.nlm.nih.gov/books/NBK62345/>
  * <https://ncbiinsights.ncbi.nlm.nih.gov/2020/02/21/rrna-databases/>
  * <https://www.ncbi.nlm.nih.gov/sars-cov-2/>
  * <https://www.ncbi.nlm.nih.gov/refseq/refseq_select/>
  * <https://blast.ncbi.nlm.nih.gov/smartblast/smartBlast.cgi?CMD=Web&PAGE_TYPE=BlastDocs#searchSets>

as well as several UniProt databases (<http://www.uniprot.org/>).

Note that:

  * The local UPPMAX copies are found at `/sw/data/blast_databases`
  * Doing `module load blast_databases` sets the environment variable `BLASTDB` to this directory; this is loaded as a prerequisite when loading any blast modules
  * New versions are installed **the first day of each month at 00.01** from local copies updated **the 28th of the previous month beginning at 00.01**
  * When new versions are installed, the directory containing the previous versions is renamed to `blast_databases_old`
  * `blast_databases_old` is deleted the second data of each month at 00.01

These databases use the "v5" format, which includes rich taxonomic infromation with sequences, and will only work with the Blast tools from the module blast/2.8.0+ and later.
Earlier module versions can still be used, but you will need to provide/build your own databases.
NCBI no longer updates databases with the older "v4" databases as of February 2020, and they have been deleted from UPPMAX.
The final updates of these databases (again, as of this writing nearly two years old) are available from NCBI over FTP at <ftp://ftp.ncbi.nlm.nih.gov/blast/db/v4>.

Each NCBI-hosted database also includes a JSON file containing additional medatadata for that particular database.
These are found in `/sw/data/blast_databases/` and are named _databasename_*.json.
The exact name varies based on the format of the database.
For example, the contents of the JSON file for the `nr` database can be see by running

```
cat /sw/data/blast_databases/nr*.json
```


The Blast databases available at UPPMAX are:

**Name** | **Type** | **Source** | **Notes**
-----|------|--------|------
**16S_ribosomal_RNA** | nucleotide | [NCBI][NCBIRRNA] | 16S ribosomal RNA (Bacteria and Archaea type strains)
**18S_fungal_sequences** | nucleotide | [NCBI][NCBIRRNA] | 18S ribosomal RNA sequences (SSU) from Fungi type and reference material (BioProject PRJNA39195)
**28S_fungal_sequences** | nucleotide | [NCBI][NCBIRRNA] | 28S ribosomal RNA sequences (LSU) from Fungi type and reference material (BioProject PRJNA51803)
**Betacoronavirus** | nucleotide | [NCBI][NCBICOVID] | Betacoronavirus nucleotide sequences
**cdd_delta** | protein | [NCBI][NCBI] | Conserved domain database for use with `delta-blast`
**env_nr** | protein | [NCBI][NCBI] | Protein sequences for metagenomes (EXCLUDED from nr)
**env_nt** | nucleotide | [NCBI][NCBI] | Nucleotide sequences for metagenomes
**human_genome** | nucleotide | [NCBI][NCBIOther] | Current RefSeq human genome assembly with various database masking
**ITS_eukaryote_sequences** | nucleotide | [NCBI][NCBIRRNA] | Internal transcribed spacer region (ITS) for eukaryotic sequences
**ITS_RefSeq_Fungi** | nucleotide | [NCBI][NCBIRRNA] | Internal transcribed spacer region (ITS) from Fungi type and reference material (BioProject PRJNA177353)
**landmark** | protein | [NCBI][NCBILandmark] | Proteomes of 27 model organisms. The landmark database includes complete proteomes from a few selected representative genomes spanning a wide taxonomic range, the main database used by the SmartBLAST services.
**LSU_eukaryote_rRNA** | nucleotide | [NCBI][NCBIRRNA] | Large subunit ribosomal RNA sequences for eukaryotic sequences
**LSU_prokaryote_rRNA** | nucleotide | [NCBI][NCBIRRNA] | Large subunit ribosomal RNA sequences for prokaryotic sequences
**mito** | nucleotide | [NCBI][NCBI] | NCBI Genomic Mitochondrial Reference Sequences
**mouse_genome** | nucleotide | [NCBI][NCBIOther] | Current RefSeq mouse genome assembly with various database masking
**nr** | protein | [NCBI][NCBI] | Non-redundant protein sequences from GenPept, Swissprot, PIR, PDF, PDB, and NCBI RefSe
**nt** | nucleotide | [NCBI][NCBI] | Partially non-redundant nucleotide sequences from all traditional divisions of GenBank, EMBL, and DDBJ
**pataa** | protein | [NCBI][NCBI] | Patent protein sequences
**patnt** | nucleotide | [NCBI][NCBI] | Patent nucleotide sequences. Both patent databases are directly from the USPTO, or from the EPO/JPO via EMBL/DDBJ
**pdbaa** | protein | [NCBI][NCBI] | Sequences for the protein structure from the Protein Data Bank
**pdbnt** | nucleitide | [NCBI][NCBI] | Sequences for the nucleotide structure from the Protein Data Bank. They are NOT the protein coding sequences for the corresponding pdbaa entries.
**ref_euk_rep_genomes** | nucleotide | [NCBI][NCBIOther] | Refseq Representative Eukaryotic genomes (1000+ organisms)
**ref_prok_rep_genomes** | nucleotide | [NCBI][NCBIOther] | Refseq Representative Prokaryotic genomes (5700+ organisms)
**ref_viroid_rep_genomes** | nucleotide | [NCBI][NCBIOther] | Refseq Representative Viroid genomes (46 organisms)
**ref_viruses_rep_genomes** | nucleotide | [NCBI][NCBIOther] | Refseq Representative Virus genomes (9000+ organisms)
**refseq_protein** | protein | [NCBI][NCBI] | NCBI protein reference sequences
**refseq_rna** | nucleotide | [NCBI][NCBI] |  NCBI Transcript reference sequences
**refseq_select_prot** | protein | [NCBI][RefSeqSelect] | NCBI RefSeq protein sequences from human, mouse, and prokaryotes, restricted to the RefSeq Select set of proteins. RefSeq Select includes one representative protein per protein-coding gene for human and mouse, and RefSeq proteins annotated on reference and representative genomes for prokaryotes
**refseq_select_rna** | nucleotide | [NCBI][RefSeqSelect] | NCBI RefSeq transcript sequences from human and mouse, restricted to the RefSeq Select set with one representative transcript per protein-coding gene
**SSU_eukaryote_rRNA** | nucleotide | [NCBI][NCBIRRNA] | Small subunit ribosomal RNA sequences for eukaryotic sequences
**swissprot** | protein | [NCBI][NCBI] | Swiss-Prot sequence database (last major update)
**tsa_nr** | protein | [NCBI][NCBITSA] | Protein sequences from the Trascriptome Shotgun Assembly. Its entries are EXCLUDED from the nr database.
**tsa_nt** | nucleotide | [NCBI][NCBITSA] | A database with earlier non-project based Transcriptome Shotgun Assembly (TSA) entries. Project-based TSA entries are NOT included. Entries are EXCLUDED from the nt database.
**uniprot_sprot** | protein | [UniProt][UniProtSPT]  | Swiss-Prot high quality manually annotated and non-redundant protein sequence database
**uniprot_trembl** | protein | [UniProt][UniProtSPT] | TrEMBL high quality but unreviewed protein sequence database
**uniprot_sptrembl** | protein | | **uniprot_sprot** and **uniprot_trembl** combined
**uniprot_all** | protein | | alias for **uniprot_sptrembl**
**uniprot_all.fasta** | protein | | alias for **uniprot_sptrembl**
**uniprot_sprot_varsplic** | protein | [UniProt][UniProtIsoforms] | UniProt canonical and isoform sequences (see link)
**uniprot_uniref50** | protein | [UniProt][UniRef] | Clustered sets of 50%-similar protein sequences (see link)
**uniprot_uniref90** | protein | [UniProt][UniRef] | Clustered sets of 90%-similar protein sequences (see link)
**uniprot_uniref100** | protein | [UniProt][UniRef] | Clustered sets of identical protein sequences (see link)
**UniVec** | nucleotide | [UniVec][UniVec] | Sequences commonly attached to cDNA/genomic DNA during the cloning process
**UniVec_Core** | nucleotide | [UniVec][UniVec] | A subset of UniVec chosen to minimise false positives

Additionally, `taxdb.btd` and `taxdb.bti` are downloaded, which provide
[additional taxonomy information for these databases][NCBI]. Local copies
of the NCBI Taxonomy databases are also available; [further details are
available on a separate page][localNCBItax].

For `UniVec` and `UniVec_Core`, Fasta-format files containing the vector
sequences are also available with the given names (e.g.,
`/sw/data/uppnex/blast_databases/UniVec`), alongside the Blast-format databases
built from the same Fasta files.

The exact times all databases were updated are provided by *database*.timestamp
files located in the directory


[NCBI]:            ftp://ftp.ncbi.nih.gov/blast/db/README
[NCBILandmark]:    https://blast.ncbi.nlm.nih.gov/smartblast/smartBlast.cgi?CMD=Web&PAGE_TYPE=BlastDocs#searchSets
[NCBITSA]:         https://www.ncbi.nlm.nih.gov/genbank/tsa/
[NCBICOVID]:       https://www.ncbi.nlm.nih.gov/sars-cov-2/
[NCBIRRNA]:        https://ncbiinsights.ncbi.nlm.nih.gov/2020/02/21/rrna-databases/
[RefSeqSelect]:    https://www.ncbi.nlm.nih.gov/refseq/refseq_select/
[NCBIOther]:       ftp://ftp.ncbi.nlm.nih.gov/blast/documents/blastdb.html
[UniRef]:          http://www.uniprot.org/uniref/
[UniProtSPT]:      http://www.uniprot.org/help/uniprotkb_sections
[UniProtIsoforms]: http://www.uniprot.org/help/canonical_and_isoforms
[UniVec]:          ftp://ftp.ncbi.nlm.nih.gov/pub/UniVec/README.uv
[localNCBItax]:    http://www.uppmax.uu.se/resources/databases/ncbi-taxonomy-databases


Databases are available automatically after loading any blast module
--------------------------------------------------------------------

When any of the **blast** modules is loaded, the `BLASTDB` environment variable
is set to the location of the local database copies
(`/sw/data/uppnex/blast_databases`).  The various Blast tools can use this variable to 
find the locations of databases, so that only the name needs to be specified.

    module load bioinfo-tools blast/2.7.1+
    blastp -db nr -query input.fasta

After loading the `blast/2.7.1+` module, specifying `blastp -db nr` results in
`blastp` searching the local copy of `nr`, because the `BLASTDB` environment
variable is set when the module is loaded.  Similarly, each of these would
result in searching the local copy of the given database:

    blastp -db pdbaa ...
    blastp -db uniprot_sprot ...
    blastp -db uniprot_uniref90 ...
    blastn -db nt ...
    blastn -db refseq_genomic ...


WGS and SRA sequence databases are not included
-----------------------------------------------

The NCBI [Whole-Genome Shotgun][WGS] is not available locally.  NCBI
provides special versions of Blast and other tools that can be used to search
the remote versions of [WGS][] and the [Sequence Read Archive][SRA].

These special blast versions and other tools are part of NCBI's [SRA
Tools][SRA_Tools], which is available at Uppmax as the **sratools** module.  We
have also include [auxiliary NCBI scripts][aux_scripts] in the **sratools**
module to convert taxonomic IDs to WGS and SRA identifiers.

[WGS]: https://www.ncbi.nlm.nih.gov/genbank/wgs/
[TSA]: https://www.ncbi.nlm.nih.gov/genbank/tsa/
[SRA]: https://www.ncbi.nlm.nih.gov/sra
[SRA_Tools]: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc
[aux_scripts]: ftp://ftp.ncbi.nlm.nih.gov/blast/WGS_TOOLS/README_BLASTWGS.txt

Note that NCBI's TSA database is available at UPPMAX, just use the database name `tsa_nr` or `tsa_nt`.
