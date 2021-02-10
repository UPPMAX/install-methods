NINJA/0.97-cluster_only
========================

<https://github.com/TravisWheelerLab/NINJA>

Used under license:
MIT
<>

Structure creating script (makeroom_NINJA_0.97-cluster_only.sh) moved to /sw/bioinfo/NINJA/makeroom_0.97-cluster_only.sh

LOG
---

    TOOL=NINJA
    VERSION=0.97-cluster_only
    /home/bjornv/git/install-methods/makeroom.sh -t "NINJA" -v "0.97-cluster_only" -w "https://github.com/TravisWheelerLab/NINJA" -l "MIT" -d "Nearly Infinite Neighbor Joining Application" -s "phylogeny" -f
    ./makeroom_NINJA_0.97-cluster_only.sh
    cd /sw/bioinfo/${TOOL}/
    source SOURCEME_NINJA_0.97-cluster_only

    module load gcc/

    cd $SRCDIR
    git clone --depth 1 --branch 0.97-cluster_only https://github.com/TravisWheelerLab/NINJA.git
    cd NINJA/NINJA
    make all
    mkdir ${PREFIX}/bin
    module load -gcc
    cp -a Ninja $PREFIX
