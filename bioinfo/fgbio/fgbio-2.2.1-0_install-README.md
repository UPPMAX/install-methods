fgbio/2.2.1-0
=============

<http://fulcrumgenomics.github.io/fgbio/>

Used under license:
MIT


Structure creating script (makeroom_fgbio_2.2.1-0.sh) moved to /sw/bioinfo/fgbio/makeroom_2.2.1-0.sh

LOG
---

    makeroom.sh -f "-t" "fgbio" "-v" "2.2.1-0" -l MIT "-d" "command line toolkit for working with genomic and particularly next generation sequencing data" "-w" "http://fulcrumgenomics.github.io/fgbio/" "-s" "misc"
    ./makeroom_fgbio_2.2.1-0.sh
    source /sw/bioinfo/fgbio/SOURCEME_fgbio_2.2.1-0
    cd $SRCDIR

    module load conda/latest
    conda create --offline -c bioconda --prefix $PREFIX/fgbio fgbio==2.2.1-0

    Now add $PREFIX/fgbio/bin to PATH.

`fgbio` is the basic executable.

    fbgio --help

