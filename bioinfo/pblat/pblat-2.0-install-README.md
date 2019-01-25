pblat/2.0
=========

Parallel blat using pthreads.

<http://icebert.github.io/pblat/>

<https://github.com/icebert/pblat>

LOG
---

    VERSION=2.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir pblat
    cd pblat
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/icebert/pblat/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd pblat-${VERSION}/
    module load gcc/6.3.0
    make
    cp pblat $PFX/

Repeat for rackham.  **On rackham5**, rsync the pblat tree over from `/mnt/sw` which
is the mount point for pica's `/sw`, first with a dry run to make sure all
looks ok, and then for real.

    cd /sw/apps/bioinfo
    rsync --dry-run --del -Pa /mnt/sw/apps/bioinfo/pblat .

If all looks ok:

    rsync --del -Pa /mnt/sw/apps/bioinfo/pblat .

and run the above instructions for installation.  When completed, make symlinks for bianca and irma and copy the tree back to pica.

    cd ../..
    ln -s rackham bianca
    ln -s rackham irma
    cd ../..
    rsync --dry-run --del -Pa pblat /mnt/sw/apps/bioinfo/

If all looks good:

    rsync --del -Pa pblat /mnt/sw/apps/bioinfo/

Set up the mf files, using the simple one from 1.6.

