mapDamage/2015-04-10
====================

Redo 2019-03-13 to use R_packages/3.5.0.

LOG
---

    VERSION=2015-04-10
    cd /sw/bioinfo/mapDamage/$VERSION
    rm -f rackham irma bianca
    mv milou rackham
    ln -s rackham irma; ln -s rackham bianca
    PFX=$PWD/$CLUSTER
    cd src
    module load python/2.7.6 bioinfo-tools pysam/0.8.3
    python setup.py install --prefix=$PFX

And then, within the mf file

    module load R/3.5.0
    module load R_packages/3.5.0
    module load python/2.7.6
    module load pysam/0.8.3

