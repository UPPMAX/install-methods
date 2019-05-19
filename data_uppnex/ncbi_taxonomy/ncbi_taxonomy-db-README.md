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

See the links for each database (given at the bottom of the page, referenced by
(...) within each table line because github doesn't allow ftp URLs, for
specifics on file format and contents.  Many tools know how to make use of
these databases; follow each tool's specific instructions.  The files can be
found in the indicated directories.

In the `latest` subdirectory:

* `taxdump.tar.gz` (taxdump), which contains several `.dmp` files
* `taxcat.tar.gz` (taxcat), which contains `categories.dmp`
* `gi_taxid_nucl.dmp.gz` (gi_taxid), which contains `gi_taxid_nucl.dmp`
* `gi_taxid_prot.dmp.gz` (gi_taxid), which contains `gi_taxid_prot.dmp`
* `taxdump_readme.txt` (taxdump), which describes the taxdump format
* `taxcat_readme.txt` (taxcat), which describes the taxcat format

In the `latest/new_taxdump` subdirectory:

* `new_taxdump.tar.gz` (new_taxdump), which contains several `.dmp` files
* `taxdump_readme.txt` (new_taxdump), which describes the new_taxdump format

In the `latest/accession2taxid` subdirectory:

* `nucl_wgs.accession2taxid` (acc2tax), TaxID mapping for nucleotide records of type WGS or TSA
* `nucl_gb.accession2taxid` (acc2tax), TaxID mapping for nucleotide records not of the above types
* `prot.accession2taxid` (acc2tax), TaxID mapping for protein records
* `pdb.accession2taxid` (acc2tax), TaxID mapping for PDB protein records
* `dead_nucl.accession2taxid` (acc2tax), TaxID mapping for dead nucleotide records
* `dead_prot.accession2taxid` (acc2tax), TaxID mapping for dead protein records
* `dead_wgs.accession2taxid` (acc2tax), TaxID mapping for dead WGS or TSA records

Biocollection information in the `latest` and `latest/biocollections` subdirectories:

* `coll_dump.txt` (taxonomy)
* `biocollections/Collection_codes.txt` (biocoll)
* `biocollections/Institution_codes.txt` (biocoll)
* `biocollections/Unique_institution_codes.txt` (biocoll)



1. **taxdump**:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump_readme.txt
2. **taxcat**:   ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxcat_readme.txt
3. **gi_taxid**: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/gi_taxid.readme
4. **acc2tax**:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/README
5. **taxonomy**: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy
6. **biocoll**:  ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/biocollections

