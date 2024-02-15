braker/3.0.7
============

<https://github.com/Gaius-Augustus/BRAKER>

Used under license:
Artistic 1.0
<https://raw.githubusercontent.com/Gaius-Augustus/BRAKER/master/LICENSE.TXT>

Structure creating script (makeroom_braker_3.0.7.sh) moved to /sw/bioinfo/braker/makeroom_3.0.7.sh

LOG
---

    makeroom.sh "-f" "-s" "annotation" "-t" "braker" "-v" "3.0.7" "-w" "https://github.com/Gaius-Augustus/BRAKER" "-l" "Artistic 1.0" "-L" "https://raw.githubusercontent.com/Gaius-Augustus/BRAKER/master/LICENSE.TXT" "-d" "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
    ./makeroom_braker_3.0.7.sh

    source /sw/bioinfo/braker/SOURCEME_braker_3.0.7 && cd $TOOLDIR

    cd $SRCDIR

    wget https://github.com/Gaius-Augustus/BRAKER/archive/refs/tags/v3.0.7.tar.gz
    tar xf v3.0.7.tar.gz 
    rmdir $PREFIX && mv BRAKER-3.0.7 $PREFIX
    cd $PREFIX
    cd scripts/
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl

    module load perl/5.32.1
    module load perl_modules/5.32.1

    module load seqstats/20170404-e6f482f
    module load ucsc-utilities/v421
    module load samtools/1.19
    module load bamtools/2.5.2
    module load diamond/2.1.9
    module load blast/2.14.1+
    module load exonerate/2.4.0
    module load GenomeThreader/1.7.4

    module load GeneMark-ETP/1.02-20231213-dd8b37b
    module load augustus/3.5.0-20231223-33fc04d


    module load spaln/2.4.0
    module load ProtHint/2.6.0
    module load cdbfasta/1.00
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

