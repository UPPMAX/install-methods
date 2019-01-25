Kraken/1.1-352e780 
==================

<https://github.com/DerrickWood/kraken>

Installing 1.1-352e780 which includes a bugfix.

LOG
---

Clone the repository and make sure the head is reset to our chosen commit.
This is Kraken v1.1 with a single bug fix.

    TOOL=/sw/apps/bioinfo/Kraken
    COMMIT_HASH=352e7804655ee6e6daeeb7e87110dd55b4ff0cae
    VERSION=1.1-${COMMIT_HASH:0:7}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    module load git/2.16.1
    [[ -d kraken ]] || git clone https://github.com/DerrickWood/kraken
    cd kraken
    git reset --hard $COMMIT_HASH
    module load gcc/6.3.0
    ./install_kraken.sh $PFX
    cd ..


