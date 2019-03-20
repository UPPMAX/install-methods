mapDamage/2.0.9
===============

Estimate damage from aligned BAM file.

It will self-report its version as 2.0.8 but it is probably actually 2.0.9.

The old installation did a lot of specific stuff.  Now use a bit more magic.  We also need to separately compile seqtk since it seems it can't be installed properly without it

<https://ginolhac.github.io/mapDamage/>

<https://github.com/ginolhac/mapDamage>


LOG
---

    TOOL=mapDamage
    VERSION=2.0.9
    mkdir -p /sw/bioinfo/$TOOL/$VERSION
    cd /sw/bioinfo/$TOOL/$VERSION
    PFX=$PWD/$CLUSTER
    mkdir -p $PFX
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://github.com/ginolhac/mapDamage/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    cd mapDamage-${VERSION}
    module load python/2.7.15
    PYTHONUSERBASE=$PFX pip install --verbose --user pysam
    cd /sw/bioinfo/mapDamage/2.0.9/src/mapDamage-2.0.9/mapdamage/seqtk
    make
    cd -
    PYTHONUSERBASE=$PFX pip install --verbose --user .

Then, provide the R packages by loading `R/3.5.2` and `R_packages/3.5.2` in the mf file.

In the mf file, add `$PFX/bin` to `PATH` and `$PFX/lib/python2.7/site-packages` to `PYTHONPATH`, and note the version discrepancy.
