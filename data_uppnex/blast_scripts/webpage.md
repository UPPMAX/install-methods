Blast databases available locally
=================================

Many pipelines involving annotation/assembly comparison involve BLAST
(<http://blast.ncbi.nlm.nih.gov/Blast.cgi>). Several blast versions are available
as modules, for example:

* **blast/2.6.0+**, etc. : the Blast+ suites (`blastp`, `tblastn`, etc.), **recommended**
* **blast/2.2.26**, etc. : 'legacy' Blast (`blastall`, `megablast`, etc)

Use `module spider blast` to see available versions.  As for all bioinformatics
tools at Uppmax, `module load bioinfo-tools` is required before the blast
modules are available.

Uppmax maintains local copies of many Blast databases, including those
available at NCBI (<ftp://ftp.ncbi.nih.gov/blast/db/README>) as well as
several UniProt databases (<http://www.uniprot.org/>).  Note that:

* The local copies are found at `/sw/data/uppnex/blast_databases`
* New versions are installed **the first day of each month at 00.01** from local copies updated **the 28th of the previous month beginning at 00.01**

The databases available are:

**Name** | **Type** | **Source** | **Notes**
-----|------|--------|------
**env_nr** | protein | [NCBI][] | Protein sequences for metagenomes
**env_nt** | nucleotide | [NCBI][] | Nucleotide sequences for metagenomes
**human_genomic** | nucleotide | [NCBI][] | Human RefSeq chromosome records
**nr** | protein | [NCBI][] | Non-redundant protein sequences
**nt** | nucleotide | [NCBI][] | Partially non-redundant nucleotide sequences
**other_genomic** | nucleotide | [NCBI][] | RefSeq chromosome records for non-human organisms
**pdbaa** | protein | [NCBI][] | Sequences for protein structures from Protein Data Bank
**refseq_genomic** | nucleotide | [NCBI][] | NCBI genomic reference sequences
**refseq_protein** | protein | [NCBI][] | NCBI protein reference sequences
**refseq_rna** | nucleotide | [NCBI][] |  NCBI Transcript reference sequences
**swissprot** | protein | [NCBI][] | Swiss-Prot sequence database
**uniprot_sprot** | protein | [UniProt][UniProtSPT]  | Swiss-Prot high quality manually annotated and non-redundant protein sequence database
**uniprot_trembl** | protein | [UniProt][UniProtSPT] | TrEMBL high quality but unreviewed protein sequence database
**uniprot_sptrembl** | protein | | **uniprot_sprot** and **uniprot_trembl** combined
**uniprot_all** | protein | | alias for **uniprot_sptrembl**
**uniprot_all**.fasta | protein | | alias for **uniprot_sptrembl**
**uniprot_sprot_varsplic** | protein | [UniProt][UniProtIsoforms] | UniProt canonical and isoform sequences (see link)
**uniprot_uniref50** | protein | [UniProt][UniRef] | Clustered sets of 50%-similar protein sequences (see link)
**uniprot_uniref90** | protein | [UniProt][UniRef] | Clustered sets of 90%-similar protein sequences (see link)
**uniprot_uniref100** | protein | [UniProt][UniRef] | Clustered sets of identical protein sequences (see link)

Additionally, `taxdb.btd` and `taxdb.bti` are downloaded, which provide [additional taxonomy information for these databases][NCBI].

The exact times all databases were updated are provided by *database*.timestamp files located in the directory

[NCBI]:            ftp://ftp.ncbi.nih.gov/blast/db/README
[UniRef]:          http://www.uniprot.org/uniref/
[UniProtSPT]:      http://www.uniprot.org/help/uniprotkb_sections
[UniProtIsoforms]: http://www.uniprot.org/help/canonical_and_isoforms


Databases are available automatically after loading any blast module
--------------------------------------------------------------------

When any of the **blast** modules is loaded, the `BLASTDB` environment variable
is set to the location of the local database copies
(`/sw/data/uppnex/blast_databases`).  The various Blast tools can use this variable to 
find the locations of databases, so that only the name needs to be specified.

    module load bioinfo-tools blast/2.6.0+
    blastp -db nr -query input.fasta

After loading the `blast/2.6.0+` module, specifying `blastp -db nr` results in
`blastp` searching the local copy of `nr`, because the `BLASTDB` environment
variable is set when the module is loaded.



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


<!--
NCBI Taxonomy database also available
-------------------------------------

The [NCBI Taxonomy database](https://www.ncbi.nlm.nih.gov/taxonomy) is also available in this same location and updated on the same schedule.
-->
