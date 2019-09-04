ART/2016-06-05
========================

<https://www.niehs.nih.gov/research/resources/software/biostatistics/art/>

Used under license:


Structure creating script (makeroom_ART_2016-06-05.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/ART/makeroom_2016-06-05.sh

LOG
---

    TOOL=ART
    VERSION=2016-06-05
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_ART_2016-06-05.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget https://www.niehs.nih.gov/research/resources/assets/docs/artalllinux64bin_gw.tar.gz 
    cd $PREFIX 
    tar xvf ../src/artalllinux64bin_gw.tar.gz ./

