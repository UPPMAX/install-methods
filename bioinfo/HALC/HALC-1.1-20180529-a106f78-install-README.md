HALC/1.1-20180529-a106f78
==========================

Bacterial recombination estimation.

<https://github.com/lanl001/halc>

Build from source in the github tree, which includes
a few fixes.  The latest commit as of this build is 27 Sep 2017, commit hash
4f13f23f8d626bbd2a6d9e8c1a2e9b85f791d7fc.

It also wishes for R with the `ape` and `phangorn` packages, which are already
in `R_packages/3.4.3`.  These will be loaded by the mf file.

LOG
---

`COMMIT_HASH` holds the full hash for the commit we want.  For versioning, we
want the first 7 characters.  After cloning the repository, reset the head to
our chosen commit.


    TOOL=HALC
    COMMIT_HASH=a106f7871f4ea383c81e9df0d707d552580a84d6
    VERSION=1.1-20180529-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/bioinfo/$TOOL/$VERSION
    cd /sw/bioinfo/$TOOL/$VERSION
    [[ -d src ]] && rm -rf src
    mkdir $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    SRCDIR=$PWD
    module load git/2.16.1
    module load python/3.6.0
    module load gcc/7.4.0
    git clone https://github.com/lanl001/halc
    cd halc
    git reset --hard $COMMIT_HASH
    make
    cd bin
    module purge
    ldd *

Everything is RPATH'd or usr-bin-env'd.

    cd ..
    cp -av bin runHALC.py $PFX/

In the mf file, load `LoRDEC/0.9` and `blasr/5.3.2` and add `$modroot/bin` and `$modroot` to `PATH`.

