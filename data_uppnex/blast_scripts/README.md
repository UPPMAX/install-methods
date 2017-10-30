# BLAST database update script

To run:

    ./update_blastdb.sh

Updates the blast databases from NCBI.  The databases that are fetched
are defined by the `dbs` array at the top of the script.

At successful exit, the blast databases are available in

    /sw/data/uppnex/blast_tmp/blastdb

... and the fetched archive files are avaliable in

    /sw/data/uppnex/blast_tmp/files-current

The above directories are left untouched if any error occurs.
The script currently detects the following errors:

* `rsync` gets stuck for 60+ seconds more than $RSYNC_RETRY_MAX (5) times.
* `md5sum` fails to verify one or more checksums.

If no data needs to be transferred, the script typically runs in about
30 seconds.

## Mode of operation

The script goes through seven stages:

1. Getting remote file list
2. Syncing file list
3. Verifying checksums
4. Removing old database files
5. Unpacking new database files
6. Fixing permission (chmod 664)
7. Cleaning up

(documentation to be improved, for now, see comments in script)

Example of transcript from successful run where the databases `pdbaa`,
`swissprot` and `taxdb` happened to have been updated:

    $ ./update_blastdb.sh
    ### Getting remote file list
    ### Syncing file list
    >f..t...... taxdb.tar.gz.md5
    >f.st...... pdbaa.tar.gz
    >f..t...... pdbaa.tar.gz.md5
    >f..t...... swissprot.tar.gz.md5
    >f.st...... taxdb.tar.gz
    >f.st...... swissprot.tar.gz
    ### Verifying checksums
    pdbaa.tar.gz: OK
    swissprot.tar.gz: OK
    taxdb.tar.gz: OK
    ### Removing old database files
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.pog
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.ppi
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.ppd
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.psi
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.psd
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.pni
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.pnd
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.psq
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.phr
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.pal
    /sw/data/uppnex/blast_tmp/blastdb/pdbaa.00.pin
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.pal
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.pin
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.phr
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.psq
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.pni
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.pnd
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.psi
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.psd
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.ppi
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.ppd
    /sw/data/uppnex/blast_tmp/blastdb/swissprot.00.pog
    /sw/data/uppnex/blast_tmp/blastdb/taxdb.bti
    /sw/data/uppnex/blast_tmp/blastdb/taxdb.btd
    ### Unpacking new database files
    swissprot.pal
    taxdb.btd
    pdbaa.pal
    swissprot.00.pin
    pdbaa.00.pin
    pdbaa.00.phr
    swissprot.00.phr
    pdbaa.00.psq
    taxdb.bti
    pdbaa.00.pni
    swissprot.00.psq
    pdbaa.00.pnd
    pdbaa.00.psi
    pdbaa.00.psd
    pdbaa.00.ppi
    pdbaa.00.ppd
    pdbaa.00.pog
    swissprot.00.pni
    swissprot.00.pnd
    swissprot.00.psi
    swissprot.00.psd
    swissprot.00.ppi
    swissprot.00.ppd
    swissprot.00.pog
    ### Cleaning up
    Done.
