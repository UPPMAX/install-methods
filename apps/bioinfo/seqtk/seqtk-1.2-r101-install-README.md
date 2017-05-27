seqtk/1.2-r101
==============

<https://github.com/lh3/seqtk>

LOG
---

Commits with bugfixes since the 1.2 release, with version updated from
r98-dirty to r101-dirty
(<https://github.com/lh3/seqtk/commit/32e7903e8fd36cf8975a05295156cc69ca57c82b>),
so version according to that.

Build for rackham et al. as well, and with new zlib.  To make versioning
consistent, also remove the 1.0 version which was identical to 1.0-r31.

    VERSION=1.2-r101
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/seqtk/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/
    git clone https://github.com/lh3/seqtk.git
    cd seqtk/
    module load gcc/6.3.0
    module load zlib/1.2.11
    make
    cp -av seqtk $PFX

There is only seqtk in this release, no `trimadap` and no `tabtk` as in some previous releases.

Simple addition to `PATH` in the mf file.
