Diamond database updates
=======================

The `diamond-update-db.sh` script is run once a month via the crontab on milou-b.

It builds five databases:

* three using NCBI's Fasta files for `nr`, `env_nr` and `swissprot`, which are built each time the update script is run on the assumption that these have frequent updates
* UniRef90, built if the `version` within the remote `RELEASE.metalink` file is different
* RefSeq, built if the remote `RELEASE_NUMBER` file is different

