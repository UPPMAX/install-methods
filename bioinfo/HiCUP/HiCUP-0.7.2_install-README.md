HiCUP/0.7.2
===========

<https://www.bioinformatics.babraham.ac.uk/projects/hicup/>

Used under license:
GPL v3 or later

Structure creating script (makeroom_HiCUP_0.7.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/HiCUP/makeroom_0.7.2.sh

We will move the unpacked directory to the $CLUSTER directory, and then change the `#!` lines to use env.

LOG
---

    makeroom.sh -t HiCUP -v 0.7.2 -w https://www.bioinformatics.babraham.ac.uk/projects/hicup/ -s misc -l "GPL v3 or later" -d "A tool for mapping and performing quality control on Hi-C data" 

    ./makeroom_HiCUP_0.7.2.sh 
    fixup HiCUP
    cd HiCUP/
    source SOURCEME_HiCUP_0.7.2 
    cd 0.7.2/
    rmdir $CLUSTER
    cd src/
    wget https://www.bioinformatics.babraham.ac.uk/projects/hicup/hicup_v${VERSION}.tar.gz
    tar xzf hicup_v${VERSION}.tar.gz 
    mv HiCUP-master ../$CLUSTER
    cd ../$CLUSTER
    sed -i -e 's,^#!/usr/bin/perl,#!/usr/bin/env perl,' hicup*
