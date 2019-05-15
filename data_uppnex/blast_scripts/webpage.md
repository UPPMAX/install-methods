Many pipelines involving annotation/assembly comparison involve Blast
(<http://blast.ncbi.nlm.nih.gov/Blast.cgi>). Several Blast versions are available
as modules, for example:

  * **blast/2.7.1+**, etc. : the Blast+ suites (`blastp`, `tblastn`, etc.), **recommended**
  * **blast/2.2.26**, etc. : 'legacy' Blast (`blastall`, `megablast`, etc)

Use `module spider blast` to see available versions.  As for all bioinformatics
tools at Uppmax, `module load bioinfo-tools` is required before the blast
modules are available.

Uppmax maintains local copies of many Blast databases, including those
available at NCBI (<ftp://ftp.ncbi.nih.gov/blast/db/README>) as well as
several UniProt databases (<http://www.uniprot.org/>).  Note that:

  * The local copies are found at `/sw/data/uppnex/blast_databases`
  * New versions are installed **the first day of each month at 00.01** from local copies updated **the 28th of the previous month beginning at 00.01**
  * When new versions are installed, the directory containing the previous versions is renamed to `blast_databases_old`
  * `blast_databases_old` is deleted the second data of each month at 00.01

The databases available are:

**Name** | **Type** | **Source** | **Notes**
-----|------|--------|------
**cdd_delta** | protein | [NCBI][NCBI] | Conserved domain database for use with `delta-blast`
**env_nr** | protein | [NCBI][NCBI] | Protein sequences for metagenomes (EXCLUDED from nr)
**env_nt** | nucleotide | [NCBI][NCBI] | Nucleotide sequences for metagenomes
**human_genomic** | nucleotide | [NCBI][NCBI] | Human RefSeq chromosome records
**nr** | protein | [NCBI][NCBI] | Non-redundant protein sequences
**nt** | nucleotide | [NCBI][NCBI] | Partially non-redundant nucleotide sequences
**other_genomic** | nucleotide | [NCBI][NCBI] | RefSeq chromosome records for non-human organisms
**pataa** | protein | [NCBI][NCBI] | Sequences for protein structures from patents (EXCLUDED from nr)
**patnt** | nucleotide | [NCBI][NCBI] | Nucleotide sequences for pataa protein structures from patents
**pdbaa** | protein | [NCBI][NCBI] | Sequences for protein structures from Protein Data Bank
**pdbnt** | nucleitide | [NCBI][NCBI] | Nucleotide sequences for pdbaa protein structures from Protein Data Bank
**refseq_genomic** | nucleotide | [NCBI][NCBI] | NCBI genomic reference sequences
**refseq_protein** | protein | [NCBI][NCBI] | NCBI protein reference sequences
**refseq_rna** | nucleotide | [NCBI][NCBI] |  NCBI Transcript reference sequences
**swissprot** | protein | [NCBI][NCBI] | Swiss-Prot sequence database
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


WGS, TSA and SRA sequence databases are not included
----------------------------------------------------

The NCBI [Whole-Genome Shotgun][WGS] is no longer downloaded locally.  NCBI
provides special versions of Blast and other tools that can be used to search
the remote versions of [WGS][], the [Transcriptome Shotgun Assembly][TSA], and
the [Sequence Read Archive][SRA].

These special blast versions and other tools are part of NCBI's [SRA
Tools][SRA_Tools], which is available at Uppmax as the **sratools** module.  We
have also include [auxiliary NCBI scripts][aux_scripts] in the **sratools**
module to convert taxonomic IDs to WGS and TSA identifiers.

[WGS]: https://www.ncbi.nlm.nih.gov/genbank/wgs/
[TSA]: https://www.ncbi.nlm.nih.gov/genbank/tsa/
[SRA]: https://www.ncbi.nlm.nih.gov/sra
[SRA_Tools]: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc
[aux_scripts]: ftp://ftp.ncbi.nlm.nih.gov/blast/WGS_TOOLS/README_BLASTWGS.txt


