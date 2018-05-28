BUSCO lineage sets
==================

BUSCO lineage sets are kept in the top of the BUSCO module directory. 

* BUSCO version 1: `/sw/apps/bioinfo/BUSCO/v1_lineage_sets/`
* BUSCO version 2: `/sw/apps/bioinfo/BUSCO/v2_lineage_sets/`
* BUSCO version 3: this uses v2 lineage sets

The download scripts fetch the lineage sets again and check to see if they are
different from what is already downloaded.  If so, the lineage set is updated,
though this is very rare.  A 'checked' file is created for each lineage set
each time an update is sought.

The `BUSCO-update-v1-lineage-sets.sh` and `BUSCO-update-v2-lineage-sets.sh` are
each run once a month via the milou-b crontab.

