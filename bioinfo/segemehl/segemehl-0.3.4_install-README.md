segemehl/0.3.4
========================

<https://www.bioinf.uni-leipzig.de/Software/segemehl/>

Used under license:
GPLv3

Structure creating script (makeroom_segemehl_0.3.4.sh) moved to /sw/bioinfo/segemehl/makeroom_0.3.4.sh

LOG
---

    TOOL=segemehl
    VERSION=0.3.4
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/segemehl/0.3.4/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "segemehl" -v "0.3.4" -w "https://www.bioinf.uni-leipzig.de/Software/segemehl/" -c "bioinfo" -s "alignment" -l "GPLv3" -d "segemehl is a software to map short sequencer reads to reference genomes" -u "rackham snowy"
    ./makeroom_segemehl_0.3.4.sh
    cd /sw/bioinfo/segemehl
    cd $SRCDIR
    wget https://www.bioinf.uni-leipzig.de/Software/segemehl/downloads/segemehl-0.3.4.tar.gz
    cd ../rackham
    tar xvf ../src/segemehl-0.3.4.tar.gz
    cd segemehl-0.3.4
    module load bioinfo-tools
    module load htslib/1.10
    make all
