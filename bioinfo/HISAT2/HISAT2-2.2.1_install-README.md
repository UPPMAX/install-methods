HISAT2/2.2.1
========================

<http://daehwankimlab.github.io/hisat2/>

Used under license:
MIT

Structure creating script (makeroom_HISAT2_2.2.1.sh) moved to /sw/bioinfo/HISAT2/makeroom_2.2.1.sh

LOG
---

    TOOL=HISAT2
    VERSION=2.2.1
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w http://daehwankimlab.github.io/hisat2/ -d "fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes as well as to a single reference genome" 
    ./makeroom_HISAT2_2.2.1.sh 
    source SOURCEME_HISAT2_2.2.1 
    wget -O hisat2-2.2.1-source.zip https://cloud.biohpc.swmed.edu/index.php/s/fE9QCsX3NH4QwBi/download
    unzip -q hisat2-2.2.1-source.zip 
    cd hisat2-2.2.1/
    module load gcc/9.3.0
    make
    cp -v hisat2 hisat2-align-? hisat2-build hisat2-build-? hisat2-inspect hisat2-inspect-? $PREFIX/
    cp -rv *.py scripts $PREFIX/

Ensure python scripts use env

    cd $PREFIX
    head -n 1 *.py

Fix the perl scripts that don't.

    cd scripts
    sed -i -e 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl

For the mf file, add `$modroot` and `$modroot/scripts` to `PATH`.

