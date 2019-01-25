rseqc/2.6.4
===========

RNA-Seq quality control package

<http://rseqc.sourceforge.net/>

Judging from the download link at
<http://rseqc.sourceforge.net/#download-rseqc>, this could just be installed
with the `pip --user` mechanism, so I'll do that.  Prepending to `PYTHONPATH`
is still required.

LOG
---

    VERSION=2.6.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/rseqc
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    module load python/2.7.11
    module load R/3.4.0
    PYTHONUSERBASE=$PFX pip install --user RSeQC

Make sure it is RSeQC 2.6.4 being installed.  This will also install `pysam` and a couple other things.

For the mf file, add `$PFX/bin` to `PATH` and
`$PFX/lib/python2.7/site-packages` to `PYTHONPATH`.

For rackham, install fresh.  rseqc/2.6.1 used the same base for all, but I
prefer to install fresh for rackham wherever practical.
