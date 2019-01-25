htseq/0.9.1
===========

RNA-Seq quality control package

<http://htseq.readthedocs.io/>

Install like `rseqc/2.6.4`.

LOG
---

    VERSION=0.9.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/htseq
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    module load python/2.7.11
    PYTHONUSERBASE=$PFX pip install --user HTSeq

Make sure it is htseq 0.9.1 being installed.  This will also install `pysam`
and a couple other things.

For the mf file, add `$PFX/bin` to `PATH` and
`$PFX/lib/python2.7/site-packages` to `PYTHONPATH`.

For rackham, install fresh, and make links for irma and bianca.
