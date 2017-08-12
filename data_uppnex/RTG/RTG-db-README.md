RealTime Genomics Preformatted References
=========================================

Updating copies of RealTime Genomics' preformatted references from

    <https://www.realtimegenomics.com/news/pre-formatted-reference-datasets>

The script is based on the one fetching BUSCO lineage sets. 
The download scripts fetch the references again and check to see if they are
different from what is already downloaded.  If so, the reference is updated,
though this is very rare.  A 'checked' file is created for each reference
each time an update is sought.

The `RTG-update-preformatted-references.sh` script is run once a month via the
milou-b crontab.

