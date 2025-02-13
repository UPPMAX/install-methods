alleleCount/4.2.1
========================

< https://github.com/cancerit/alleleCount>

Used under license:
AGPL v3


Structure creating script (makeroom_alleleCount_4.2.1.sh) moved to /sw/bioinfo/alleleCount/makeroom_4.2.1.sh

LOG
---

    makeroom.sh "-t" "alleleCount" "-v" "4.2.1" "-w" " https://github.com/cancerit/alleleCount" "-c" "bioinfo" "-l" "AGPL v3" "-d" "Support code for NGS copy number algorithms. Takes a file of locations and a [cr|b]am file and generates a count of coverage of each allele [ACGT] at that location" "-s" "misc" "-f"
    ./makeroom_alleleCount_4.2.1.sh

    source /sw/bioinfo/alleleCount/SOURCEME_alleleCount_4.2.1 && cd $SRCDIR
    wget https://github.com/cancerit/alleleCount/archive/refs/tags/v4.2.1.tar.gz    
    tar xzvf v4.2.1.tar.gz
    rm v4.2.1.tar.gz
    ml BioPerl/1.7.8-perl5.32.1
    cd alleleCount-4.2.1/
    ./setup.sh $PREFIX

This takes a while. By default, the script will try to use up to 6 cores.

Install latest ASCAT package in the module
    ml R_packages/4.3.1
    export R_LIBS_USER=$PREFIX/lib
in R
    devtools::install_github('VanLoo-lab/ascat/ASCAT', upgrade='never')
back in bash console
    prepend R_LIBS_SITE
