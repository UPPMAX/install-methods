MaxBin/2.2.5
========================

<https://downloads.jbei.org/data/microbial_communities/MaxBin/MaxBin.html>

LOG
---

    TOOL=MaxBin
    VERSION=2.2.5
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_MaxBin_2.2.5.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src

    wget https://downloads.jbei.org/data/microbial_communities/MaxBin/getfile.php?MaxBin-2.2.5.tar.gz
    tar xzf getfile.php\?MaxBin-2.2.5.tar.gz
    cd MaxBin-2.2.5/src/
    make
    cd ..
    ./autobuild_auxiliary
    mv * ../../rackham 
    vim ../../rackham/setting
