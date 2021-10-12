MaSuRCA/4.0.4
========================

<https://github.com/alekseyzimin/masurca>

Used under license:
GPL v3 license


Structure creating script (makeroom_MaSuRCA_4.0.4.sh) moved to /sw/bioinfo/MaSuRCA/makeroom_4.0.4.sh

The `install.sh` script recognises a `DEST` variable, but that does not install
`Flye/`, at least.  So, replace `$PREFIX` with the unpacked directory, and
build in place.

Also, ensure that `PATH` is very clean.

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "MaSuRCA" -v "4.0.4" -w "https://github.com/alekseyzimin/masurca" -c "bioinfo" -l "GPL v3 license" -d "The MaSuRCA \\(Maryland Super Read Cabog Assembler\\) genome assembly and analysis toolkit contains of MaSuRCA genome assembler\\, QuORUM error corrector for Illumina data\\, POLCA genome polishing software\\, Chromosome scaffolder\\, jellyfish mer counter\\, and MUMmer aligner." -x "INSTALL" -f"
    ./makeroom_MaSuRCA_4.0.4.sh

    source SOURCEME_MaSuRCA_4.0.4
    cd $SRCDIR
    wget https://github.com/alekseyzimin/masurca/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${TOOL}-${VERSION} $PREFIX
    cd $PREFIX
    ml gcc/9.3.0
    ml perl/5.26.2 perl_modules/5.26.2
    ./install.sh 

#Change headers in CA8, the rest seem ok.

    cd CA8/Linux-amd64/bin/
    for F in $(file * | grep Perl | cut -f1 -d:) ; do sed -i 's,#!.*perl$,#!/usr/bin/env perl,' $F; done

Use mf from 4.0.4.
