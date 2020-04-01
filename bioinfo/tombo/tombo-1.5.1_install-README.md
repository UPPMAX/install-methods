tombo/1.5.1
========================

<https://github.com/nanoporetech/tombo>

Used under license:
MPL2

Structure creating script (makeroom_tombo_1.5.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/tombo/makeroom_1.5.1.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "tombo" -l "MPL2" -w "https://github.com/nanoporetech/tombo" -d "Tombo is a suite of tools primarily for the identification of modified nucleotides from raw nanopore sequencing data." -v "1.5.1" -s "misc"

LOG
---

    TOOL=tombo
    VERSION=1.5.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "tombo" -l "MPL2" -w "https://github.com/nanoporetech/tombo" -d "Tombo is a suite of tools primarily for the identification of modified nucleotides from raw nanopore sequencing data." -v "1.5.1" -s "misc"
    ./makeroom_tombo_1.5.1.sh
    cd $TOOLDIR
    lista
    ml python3/3.7.2
    pip3 install ont-tombo[full] --target=$PREFIX
