sickle/1.33-20-g4b0dc85-mullins
===============================

<https://github.com/MullinsLab/sickle>, which is a maintained fork of the
original at <https://github.com/najoshi/sickle>.

Note the latest version at the `najoshi/sickle` repository is 1.33, and the
`Mullinslab/sickle` repository versions via commit hash off that.

LOG
---

    VERSION=1.33-20-g4b0dc85-mullins
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/sickle
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    git clone https://github.com/MullinsLab/sickle.git
    cd sickle/
    module load gcc/6.3.0
    make
    cp -av sickle $PFX/

Make sure no library load issues.

    ldd sickle 

The mf file is a simple addition to `PATH`.  Build special for rackham.
