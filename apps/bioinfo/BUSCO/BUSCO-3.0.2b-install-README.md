BUSCO/3.0.2b
============

Check gene content of assemblies.

<http://busco.ezlab.org/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.0.2b
    cd /sw/apps/bioinfo/BUSCO/
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    module load git/2.16.1
    git clone https://gitlab.com/ezlab/busco.git
    cd busco
    module load python/3.5.0
    PYTHONUSERBASE=$PFX pip3 install --user .


We download the tagged release from gitlab.

Get scripts ready for running on UPPMAX. Hash-bang line should be
`#!/usr/bin/env python3`, we load `python/3.5.0`.

    vi *.py

And make a symlink so the name `BUSCO` can be used to run the tool.  A change
from 1.22, the python scripts are shipped with executable permission.

    ln -s BUSCO.py BUSCO

In the mf file, as for 1.22 we load blast+, hmmer and augustus.  Here the versions
are `blast/2.6.0+`, `hmmer/3.1b2`, and `augustus/3.2.3`.  I've simplified the printed
message on module load to point toward `module help BUSCO/2.0.1`.  There are a **LOT**
more lineage sets and we list them all in the help.

Also copy over the `augustus_config_copy` script from `augustus/3.2.3` to be
**sourced**, which creates a local copy of the augustus config directory for
the user.  Busco can't seem to work around this being read-only.  Add
instructions for its use to module load and module help.  See these and the
script for more.

Created `BUSCO-update-v2-lineage-sets.sh` to download the lineage sets, and added it to
the crontab on milou-b.
