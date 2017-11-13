NCBI taxonomy database updates
=======================

The `ncbi_taxonomy-update-dbs.sh` script is run once a month via the crontab on milou-b.

It updates several taxonomy databases from <ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy>.

* The local copies are found at
    * `/sw/data/uppnex/ncbi_taxonomy/latest/`
    * `/sw/data/uppnex/ncbi_taxonomy/accession2taxid/latest/`
    * `/sw/data/uppnex/ncbi_taxonomy/biocollection/latest/`
* The installation of new versions begins **the first day of each month at 00.10**.  The update may take several minutes up to an hour, depending on network speeds.
* The `latest/` directories are symbolic links to a directory named from the date of the database update
* When new versions are successfully installed, the `latest/` symbolic link is updated to point to the new dated directory
* The previous version of the taxonomy databases are removed on a haphazard schedule

In the `latest` subdirectory:

* [`taxdump.tar.gz`][taxdump], which contains several `.dmp` files
* [`taxcat.tar.gz`][taxcat], which contains `categories.dmp`
* [`gi_taxid_nucl.dmp.gz`][gi_taxid], which contains `gi_taxid_nucl.dmp`
* [`gi_taxid_nucl_diff.dmp.gz`][gi_taxid], which contains `gi_taxid_nucl_diff.dmp`
* [`gi_taxid_prot.dmp.gz`][gi_taxid], which contains `gi_taxid_prot.dmp`
* [`gi_taxid_prot_diff.dmp.gz`][gi_taxid], which contains `gi_taxid_prot_diff.dmp`

In the `accession2taxid/latest` subdirectory:

* [`nucl_est.accession2taxid`][acc2tax],TaxID mapping for nucleotide records of type EST
* [`nucl_gss.accession2taxid`][acc2tax], TaxID mapping for nucleotide records of type GSS
* [`nucl_wgs.accession2taxid`][acc2tax], TaxID mapping for nucleotide records of type WGS or TSA
* [`nucl_gb.accession2taxid`][acc2tax], TaxID mapping for nucleotide records not of the above types
* [`prot.accession2taxid`][acc2tax], TaxID mapping for protein records
* [`pdb.accession2taxid`][acc2tax], TaxID mapping for PDB protein records
* [`dead_nucl.accession2taxid`][acc2tax], TaxID mapping for dead nucleotide records
* [`dead_prot.accession2taxid`][acc2tax], TaxID mapping for dead protein records
* [`dead_wgs.accession2taxid`][acc2tax], TaxID mapping for dead WGS or TSA records

Biocollection information in the `latest` and `biocollections/latest` subdirectories:

* [`coll_dump.txt`][taxonomy] | 
* [`biocollections/Collection_codes.txt`][biocoll]
* [`biocollections/Institution_codes.txt`][biocoll]
* [`biocollections/Unique_institution_codes.txt`][biocoll]

[taxdump]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_readme.txt
[taxcat]:   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxcat_readme.txt
[gi_taxid]: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme
[acc2tax]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README
[taxonomy]: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy
[biocoll]:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections

