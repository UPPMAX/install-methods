ClonalFrameML/1.11-4f13f23
==========================

Bacterial recombination estimation.

<https://github.com/xavierdidelot/ClonalFrameML>

Build from source in the github tree (**not** the 1.11 release), which includes
a few fixes.  The latest commit as of this build is 27 Sep 2017, commit hash
4f13f23f8d626bbd2a6d9e8c1a2e9b85f791d7fc.

It also wishes for R with the `ape` and `phangorn` packages, which are already
in `R_packages/3.4.3`.  These will be loaded by the mf file.

LOG
---

`COMMIT_HASH` holds the full hash for the commit we want.  For versioning, we
want the first 7 characters.  After cloning the repository, reset the head to
our chosen commit.


    TOOL=ClonalFrameML
    COMMIT_HASH=4f13f23f8d626bbd2a6d9e8c1a2e9b85f791d7fc
    VERSION=1.11-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL/$VERSION
    cd /sw/apps/bioinfo/$TOOL/$VERSION
    [[ -d src_$CLUSTER ]] && rm -rf src_$CLUSTER
    mkdir $CLUSTER src_$CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    SRCDIR=$PWD
    module load git/2.16.1
    module load gcc/6.3.0

    git clone https://github.com/xavierdidelot/ClonalFrameML.git
    cd ClonalFrameML
    git reset --hard $COMMIT_HASH

    cd src
    ./make.sh
    cp -av ClonalFrameML $PFX/
    for S in cfml_results.R ; do
        [[ -f $S ]] || { echo "R script '$S' not found"; return; }
        (echo '#!/usr/bin/env Rscript' && cat $S) > $PFX/$S && chmod +x $PFX/$S
    done

