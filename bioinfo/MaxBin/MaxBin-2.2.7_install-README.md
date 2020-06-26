MaxBin/2.2.7
========================

<http://downloads.jbei.org/data/MaxBin.html>

Used under license:
BSD

Structure creating script (makeroom_MaxBin_2.2.7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MaxBin/makeroom_2.2.7.sh

LOG
---

    TOOL=MaxBin
    VERSION=2.2.7
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/douglas/bin/makeroom.sh -f" -s "misc" -t "MaxBin" -v "2.2.7" -w "http://downloads.jbei.org/data/MaxBin.html" -l "BSD" -d "software for binning assembled metagenomic sequences based on an Expectation-Maximization algorithm"
    ./makeroom_MaxBin_2.2.7.sh
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
