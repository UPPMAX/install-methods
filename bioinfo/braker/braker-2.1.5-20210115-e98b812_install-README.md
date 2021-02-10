braker/2.1.5-20210115-e98b812
========================

<https://github.com/Gaius-Augustus/BRAKER>

Used under license:
Artistic

Structure creating script (makeroom_braker_2.1.5-20210115-e98b812.sh) moved to /sw/bioinfo/braker/makeroom_2.1.5-20210115-e98b812.sh

LOG
---

    TOOL=braker
    COMMIT=e98b812
    VERSION=2.1.5-20210115-$COMMIT
    makeroom.sh -f" -s "annotation" -t "$TOOL" -v "$VERSION" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load git/2.28.0

    cd $VERSION/src
    git clone https://github.com/Gaius-Augustus/BRAKER
    cd BRAKER
    git reset --hard $COMMIT
    cd ..
    rmdir $PREFIX
    mv BRAKER $PREFIX
    cd $PREFIX/scripts
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load python/3.7.2
    module load bioinfo-tools
    module load biopython/1.76-py3
    module load augustus/3.4.0
    module load bamtools/2.5.1
    module load blast/2.2.31+
    module load GeneMark/4.62-es
    module load GenomeThreader/1.7.1
    module load exonerate/2.2.0
    module load spaln/2.4.0
    module load samtools/1.8
    module load ProtHint/2.5.0
    module load diamond/0.9.31
    module load cdbfasta/1.00
    module load ucsc-utilities/v398
    module load MakeHub/1.0.5-1ecd6bb
    module load GUSHR/1.0.0


Add `$modroot/scripts` to `PATH`.


No testing for this version yet.


Testing
-------

Running `source $AUGUSTUS_CONFIG_COPY` is always required to set up an annotation environment, and that script was modified to print its export line for `AUGUSTUS_CONFIG_PATH` since that always need to be set after the config directory is created.

Running tests:

    cd /sw/bioinfo/braker/2.1.5/src/BRAKER-2.1.5/example

Download missing RNA-Seq test data:

    wget http://bioinf.uni-greifswald.de/bioinf/braker/RNAseq.bam

Run the tests.

    cd tests
    ./test1.sh

All Augustus tools are sought based off `AUGUSTUS_CONFIG_PATH`, so both `AUGUSTUS_BIN_PATH` and `AUGUSTUS_SCRIPTS_PATH` must both be set.  This was in the readme, but buried.  I chose to set these in the augustus/3.3.3 module file.

Biopython was also required, also buried in the readme.

Also, a `--prog=` option is missing from `test2.sh`.

`braker.pl` could not find GenomeThreader's `prothint.py` script, because it was attempting to use `ALIGNMENT_TOOL_PATH`..  So, `braker.pl` was modified as follows:

braker.pl line 4967: find `prothint.py` using `PATH` instead of `ALIGNMENT_TOOL_PATH`.

In general, all the use of environment variables instead of `PATH` makes it less straightforward than it can be to incorporate braker into a module system.

