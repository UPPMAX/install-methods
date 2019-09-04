awscli/1.11.140
===========

Install amazon web services command line interface

LOG
---

    VERSION=1.11.140
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/awscli
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    module load python/2.7.11
    PYTHONUSERBASE=$PFX pip install -I --user awscli

Make sure it is awscli 1.11.140 being installed.  This will also install a few
other packages.

For the mf file, add `$PFX/bin` to `PATH` and
`$PFX/lib/python2.7/site-packages` to `PYTHONPATH`.

For rackham, install fresh, and make links for irma and bianca.
