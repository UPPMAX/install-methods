fgbio/2.1.0
========================

<http://fulcrumgenomics.github.io/fgbio/>

Used under license:



Structure creating script (makeroom_fgbio_2.1.0.sh) moved to /sw/bioinfo/fgbio/makeroom_2.1.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-t" "fgbio" "-v" "2.1.0" "-d" "command line toolkit for working with genomic and particularly next generation sequencing data" "-w" "http://fulcrumgenomics.github.io/fgbio/" "-s" "misc"
    ./makeroom_fgbio_2.1.0.sh
    source /sw/bioinfo/fgbio/SOURCEME_fgbio_2.1.0
    cd $SRCDIR

    module load conda/latest
    conda create --offline -c bioconda --prefix $PREFIX/fgbio fgbio

    Now add $PREFIX/fgbio/bin to PATH.

`fgbio` is the basic executable.

    fbgio --version

