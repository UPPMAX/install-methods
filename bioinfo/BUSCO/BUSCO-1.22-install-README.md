BUSCO 1.22
==========

Check gene content of assemblies.

<http://busco.ezlab.org/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=1.22
    cd /sw/apps/bioinfo/BUSCO/
    mkdir -p $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    cd src

Do we need to redownload the source package?

    wget http://busco.ezlab.org/files/BUSCO_v${VERSION}.tar.gz
    tar xzf BUSCO_v${VERSION}.tar.gz
    cd BUSCO_v${VERSION}

Get script ready for running on UPPMAX. Hash-bang line should be
`#!/usr/bin/env python3`, we load python/3.5.0.

    vi BUSCO_v${VERSION}.py
    chmod +x BUSCO_v${VERSION}.py
    ln -s BUSCO_v${VERSION}.py BUSCO

Also create `augustus_config_copy` script to be **sourced**, which creates a
local copy of the augustus config directory for the user.  Busco can't seem to
work around this being read-only.  Add instructions for its use to module load
and module help.  See these and the script for more.

Remove load of EMBOSS, since BUSCO removed this as a dependency.

Also update the lineage sets, if required, by running
`BUSCO-update-lineage-sets.sh` within `lineage_sets/`.  They weren't.

