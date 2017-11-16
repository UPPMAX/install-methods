NCBI taxonomy database updates
=======================

The `ncbi_taxonomy-update-dbs.sh` script is run once a week via the crontab on milou-b.

It updates several taxonomy databases from <ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy>.
* The local copies are found at `/sw/data/uppnex/ncbi_taxonomy/latest`
* This also contains the subdirectories `accession2taxid` and `biocollections` containing those databases, see the tables below for their contents
* `latest` is a symbolic link to a directory named from the date of the most recent update
* There is also a subdirectory `download` containing the files as downloaded from NCBI
* The installation of new versions begins **the first day of each month at 00.10**.  The update may take several minutes up to an hour, depending on network speeds.
* When new versions are successfully installed, the `latest/` symbolic link is updated to point to the new dated directory
* The previous version of the taxonomy databases are removed when the new versions have completed installation

See the links for each database for specifics on file format and contents.
Many tools know how to make use of these databases; follow each tool's specific
instructions.  The files can be found in the indicated directories.

In the `latest` subdirectory:

* [`taxdump.tar.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_readme.txt), which contains several `.dmp` files
* [`taxcat.tar.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxcat_readme.txt), which contains `categories.dmp`
* [`gi_taxid_nucl.dmp.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme), which contains `gi_taxid_nucl.dmp`
* [`gi_taxid_nucl_diff.dmp.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme), which contains `gi_taxid_nucl_diff.dmp`
* [`gi_taxid_prot.dmp.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme), which contains `gi_taxid_prot.dmp`
* [`gi_taxid_prot_diff.dmp.gz`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme), which contains `gi_taxid_prot_diff.dmp`

In the `latest/accession2taxid` subdirectory:

* [`nucl_est.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README),TaxID mapping for nucleotide records of type EST
* [`nucl_gss.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for nucleotide records of type GSS
* [`nucl_wgs.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for nucleotide records of type WGS or TSA
* [`nucl_gb.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for nucleotide records not of the above types
* [`prot.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for protein records
* [`pdb.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for PDB protein records
* [`dead_nucl.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for dead nucleotide records
* [`dead_prot.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for dead protein records
* [`dead_wgs.accession2taxid`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README), TaxID mapping for dead WGS or TSA records

Biocollection information in the `latest` and `latest/biocollections` subdirectories:

* [`coll_dump.txt`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy) | 
* [`biocollections/Collection_codes.txt`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections)
* [`biocollections/Institution_codes.txt`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections)
* [`biocollections/Unique_institution_codes.txt`](ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections)

[taxdump]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_readme.txt
[taxcat]:   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxcat_readme.txt
[gi_taxid]: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme
[acc2tax]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README
[taxonomy]: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy
[biocoll]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections

