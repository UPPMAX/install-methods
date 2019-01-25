fermikit-0.14-prerelease-96f7820-install-README.md
==================================================

<https://github.com/lh3/fermikit>

Version based on prerelease info from repository, and include last commit hash.

LOG
---

Done on milou, should work for all others.

    VERSION=0.14-prerelease-96f7820/
    CLUSTER=milou
    cd /sw/apps/bioinfo/fermikit/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    ln -s ./$CLUSTER rackham
    ln -s ./$CLUSTER irma
    ln -s ./$CLUSTER bianca
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    module load gcc/5.4.0 
    module load zlib/1.2.11
    module load git/2.10.2
    git clone --recursive https://github.com/lh3/fermikit.git
    make

