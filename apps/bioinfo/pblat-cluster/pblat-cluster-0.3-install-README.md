pblat-cluster/0.3
=================

MPI pblat

<http://icebert.github.io/pblat-cluster/>

<https://github.com/icebert/pblat-cluster>

LOG
---

    VERSION=0.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir pblat-cluster
    cd pblat-cluster
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/icebert/pblat-cluster/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    cd pblat-cluster-${VERSION}/
    module load gcc/6.3.0
    module load openmpi/2.1.0
    make
    cp pblat-cluster $PFX/

Repeat for rackham.  **On rackham5**, rsync the pblat-cluster tree over from
`/mnt/sw` which is the mount point for pica's `/sw`, first with a dry run to
make sure all looks ok, and then for real.

    cd /sw/apps/bioinfo
    rsync --dry-run --del -Pa /mnt/sw/apps/bioinfo/pblat-cluster .

If all looks ok:

    rsync --del -Pa /mnt/sw/apps/bioinfo/pblat-cluster .

and run the above instructions for installation.  When completed, make symlinks
for bianca and irma and copy the tree back to pica.

    cd ../..
    ln -s rackham bianca
    ln -s rackham irma
    cd ../..
    rsync --dry-run --del -Pa pblat-cluster /mnt/sw/apps/bioinfo/

If all looks good:

    rsync --del -Pa pblat-cluster /mnt/sw/apps/bioinfo/

Set up the mf files, updating the 0.1 version by loading `gcc/6.3.0` and `openmpi/2.1.0`.

