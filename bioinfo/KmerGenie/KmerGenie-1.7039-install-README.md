# KmerGenie-1.7039-install-README.md

KmerGenie
=========

estimates the best k-mer length for genome de novo assembly
<http://kmergenie.bx.psu.edu>

Installation
------------

Software is compiled and run from a copy of the source folder.

    VERS=1.7039
    APPL=KmerGenie
    VDIR=/sw/apps/bioinfo/$APPL/$VERS
    SITE=http://kmergenie.bx.psu.edu

    mkdir -p $VDIR/src  # could test for existence but no error raised anyway
    cd $VDIR/src
    [[ -e kmergenie-$VERS.tar.gz ]] || wget $SITE/kmergenie-$VERS.tar.gz
    cd ..
    tar xzf src/kmergenie-$VERS.tar.gz
    mv kmergenie-$VERS $CLUSTER
    cd $CLUSTER
    make
    cd ..

Additional steps for dependent clusters
---------------------------------------

If on cluster that doesn't have dominant storage cluster but that cluster
is mounted as '/mnt' (eg, if on Rackham when /pica/sw is available as /mnt/sw):

    REMO=$CLUSTER
    mv $CLUSTER /mnt$(pwd)/r
    sleep 3

Otherwise, move via scp, rsync, etc. Make certain to avoid same name during
copy to avoid race condition.

Switch to cluster with dominant storage (eg, Milou)
(assuming variables are manually copied)

    cd /sw/apps/bioinfo/$APPL/$VERS
    mv r $REMO
