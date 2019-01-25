seqtk/1.0-r57
==============

<https://github.com/lh3/seqtk>

LOG
---

An old github clone was hanging around at the top level, turns out it is this
release, which includes tabtk as well.  Perhaps there is some historical
interest but it is painless to add.

Build for rackham et al. as well, and with new zlib.

    VERSION=1.0-r57
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/seqtk/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src/

Since Wes owns the clone, I will make my own copy of it.

    mv ../../github _github
    mkdir seqtk
    cd seqtk
    cp -av ../_github/.??* ../_github/* .
    module load gcc/6.3.0
    module load zlib/1.2.11
    make
    cp -av seqtk trimadap tabtk $PFX

Simple addition to `PATH` in the mf file.
