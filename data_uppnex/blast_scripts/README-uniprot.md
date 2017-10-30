# BLAST database update script for UniProt

To run:

    ./update_blastdb-uniprot.sh

Updates the UniProt blast databases from EBI.  The original fasta files
are mirrored with lftp and new blast databases are built from these
if required using a Makefile (uniprot.mk).

At successful exit, the blast databases are available in

    /sw/data/uppnex/blast_tmp/uniprot/blastdb

... and the original fasta files are available in the mirrored hierarchy

     /sw/data/uppnex/blast_tmp/uniprot/current_release

as well as symbolic links from the `uniprot` directory.

The databases that are built:

Small (single segment):

* uniprot_sprot
* uniprot_sprot_varsplic

Large (multiple segments):

* uniprot_sptrembl
* uniprot_trembl
* uniprot_uniref100
* uniprot_uniref50
* uniprot_uniref90

The release number is picked up from the `RELEASE.metalink` XML file on
the EBI FTP site and used in the blast database title for identification.
