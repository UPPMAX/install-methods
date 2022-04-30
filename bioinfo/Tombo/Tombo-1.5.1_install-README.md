Tombo/1.5.1
===========

<https://github.com/nanoporetech/tombo>

Used under license:
Mozilla Public License 2.0

Structure creating script (makeroom_Tombo_1.5.1.sh) moved to /sw/bioinfo/Tombo/makeroom_1.5.1.sh

LOG
---

    TOOL=Tombo
    VERSION=1.5.1
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -c bioinfo -s misc -w https://github.com/nanoporetech/tombo -l "Mozilla Public License 2.0" -d "suite of tools primarily for the identification of modified nucleotides from nanopore sequencing data"
    ./makeroom_Tombo_1.5.1.sh
    cd Tombo/
    source SOURCEME_Tombo_1.5.1 
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install --user ont-tombo==1.5.1

Use the mf file from MultiQC/1.9, but add load of R/4.0.0 and R_packages/4.0.0 which are required for plotting.

