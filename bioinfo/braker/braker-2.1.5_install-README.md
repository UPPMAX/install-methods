braker/2.1.5
============

<https://github.com/Gaius-Augustus/BRAKER>

Used under license:
Artistic

Structure creating script (makeroom_braker_2.1.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/braker/makeroom_2.1.5.sh

LOG
---

    TOOL=braker
    VERSION=2.1.5
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f" -s "annotation" -t "$TOOL" -v "${VERSION}" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd $VERSION/src
    wget https://github.com/Gaius-Augustus/BRAKER/archive/v${VERSION}.tar.gz


Braker allows using different tools at different stages.  We load some
alternatives: for reducing the training gene set, `blast/2.2.31+` and
`diamond/0.9.31`; protein aligners, `exonerate/2.2.0`, `spaln/2.4.0` and
`GenomeThreader/1.7.1`.

Many modules are loaded as prerequisites.  Many new ones were installed as part
of this installation: GenomeThreader/1.7.1, spaln/2.4.0, ProtHint/2.4.0,
cdbfasta/1.00, ucsc-utilities/v398, and MakeHub/1.0.5-1ecd6bb.

    perl/5.26.2
    perl_modules/5.26.2
    python/3.7.2
    biopython/1.76-py3
    augustus/3.3.3
    bamtools/2.5.1
    blast/2.2.31+
    GeneMark/4.57-es
    GenomeThreader/1.7.1
    exonerate/2.2.0
    spaln/2.4.0
    samtools/1.8
    ProtHint/2.4.0
    diamond/0.9.31
    cdbfasta/1.00
    ucsc-utilities/v398
    MakeHub/1.0.5-1ecd6bb


Remember to set up the GeneMark license file, and the augustus configuration directory.  For instructions,
see 'module help GeneMark/4.57-es' and 'module help augustus/3.3.3'

Once set up, your own copy of the augustus configuration directory does not need to be created each time.
It should be persistent, so that training results can be reused from run to run.  Just make sure to set
AUGUSTUS_CONFIG_PATH to its location.

Userguide is : /sw/bioinfo/braker/2.1.5/rackham/docs/userguide.pdf

More information at http://bioinf.uni-greifswald.de/bioinf/braker/index.html

Add `/sw/bioinfo/braker/2.1.5/rackham/scripts` to `PATH`.

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

