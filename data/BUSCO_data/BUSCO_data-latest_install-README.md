BUSCO_data/latest
=================

Datasets licence: Creative Commons Attribution-NoDerivatives 4.0 International License
Datasets licence URL: <http://creativecommons.org/licenses/by-nd/4.0/>

Data module for BUSCO lineage sets.

BUSCO lineage sets are kept here, and are referred to by symbolic lines in the
top of the BUSCO module directory. 

* BUSCO version 1: `/sw/data/BUSCO_data/latest/rackham/v1_lineage_sets/`
    This is the target of the symbolic link `/sw/bioinfo/BUSCO/v1_lineage_sets`.
* BUSCO version 2: `/sw/data/BUSCO_data/latest/rackham/v2_lineage_sets/`
    This is the target of the symbolic link `/sw/bioinfo/BUSCO/v2_lineage_sets`.
* BUSCO version 3: `/sw/data/BUSCO_data/latest/rackham/v3_lineage_sets/`
    This is a symbolic link to the v2 lineage sets.
    This is the target of the symbolic link `/sw/bioinfo/BUSCO/v3_lineage_sets`.
* BUSCO version 4: `/sw/data/BUSCO_data/latest/rackham/v4_lineage_sets/`
    This is the target of the symbolic link `/sw/bioinfo/BUSCO/v4_lineage_sets`.
* BUSCO version 5: `/sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/`
    This is the target of the symbolic link `/sw/bioinfo/BUSCO/v4_lineage_sets`.

The download scripts for each version of BUSCO lineage sets are found in 
`/sw/data/BUSCO_data/latest/rackham/`:

* `BUSCO-update-v1-lineage-sets.sh`
* `BUSCO-update-v2-lineage-sets.sh`
* `BUSCO-update-v4-lineage-sets.sh`
* `BUSCO-update-v5-lineage-sets.sh`

These each contain a hard-coded path to the location of the corresponding
lineage set.

The download scripts fetch the lineage sets again and check to see if they are
different from what is already downloaded.  If so, the lineage set is updated,
though this is very rare.  A 'checked' file is created for each lineage set
each time an update is sought.

The v4 and v5 scripts are run once a month via douglas's rackham5 crontab. The
v1 and v2 scripts are no longer run. Their crontab entries remain but are
commented out.


