Beagle/5.1
========================

<https://faculty.washington.edu/browning/beagle/beagle.html>

Used under license:
GNU
<>

Structure creating script (makeroom_Beagle_5.1.sh) moved to /sw/bioinfo/Beagle/makeroom_5.1.sh

LOG
---

    TOOL=Beagle
    VERSION=5.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Beagle/5.1/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "Beagle" -v "5.1" -c "bioinfo" -w "https://faculty.washington.edu/browning/beagle/beagle.html" -l "GNU" -d "Beagle is a software package for phasing genotypes and for imputing ungenotyped markers." -x "INSTALL" -f" -s "misc"
    ./makeroom_Beagle_5.1.sh
    cd $SRCDIR
    cd rackham 
    wget wget https://faculty.washington.edu/browning/beagle/beagle.18May20.d20.jar
    lns -s beagle.18May20.d20.jar beagle.jar

