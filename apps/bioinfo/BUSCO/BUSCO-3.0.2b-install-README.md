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
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src_${CLUSTER}
    cd src_${CLUSTER}
    module load git/2.16.1
    [[ -d busco ]] || git clone https://gitlab.com/ezlab/busco.git
    cd busco
    module load python/3.4.3
    PYTHONUSERBASE=$PFX pip3 install --user .

This installs the python packages busco and pipebricks.  It does not install
the other scripts, data etc. for running BUSCO itself.  These commands do.


    cp -av sample_data $PFX/
    cp -av scripts $PFX/bin
    cp ../milou/config.ini .
    cp -av ../milou/augustus_config_copy .
    cp -av ../milou/BUSCO_v3_userguide.pdf .

We must make sure `BUSCO_CONFIG_FILE` is set, and that config.ini contains
settings for the cluster we are on.  The switch to the config file means that
we include paths to tools, in addition to loading the same tools as modules.
Redundant, but checking the python packages for handling the config indicates
that setting these paths is typically required. 

We download the tagged release from gitlab.

Get scripts ready for running on UPPMAX. Hash-bang line should be
`#!/usr/bin/env python3`, we load `python/3.4.3`.

    vi *.py

The name of the run script is changed to `run_BUSCO.py`.

In the mf file, as for 1.22 we load blast+, hmmer and augustus.  Here the versions
are `blast/2.6.0+`, `hmmer/3.1b2`, and `augustus/3.2.3`.  I've simplified the printed
message on module load to point toward `module help BUSCO/3.0.2b`.  There are a **LOT**
more lineage sets and we list them all in the help.

Also copy over the `augustus_config_copy` script from `augustus/3.2.3` to be
**sourced**, which creates a local copy of the augustus config directory for
the user.  Busco can't seem to work around this being read-only.  Add
instructions for its use to module load and module help.  See these and the
script for more.

Lineage sets
------------

BUSCO v3 uses the v2 lineage sets, so `v3_lineage_sets` is a symlink to the v2 one.

