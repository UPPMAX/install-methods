braker/3.0.8
============

<https://github.com/Gaius-Augustus/BRAKER>

Used under license:
Artistic 1.0
<https://raw.githubusercontent.com/Gaius-Augustus/BRAKER/master/LICENSE.TXT>

Structure creating script (makeroom_braker_3.0.8.sh) moved to /sw/bioinfo/braker/makeroom_3.0.8.sh

LOG
---

    makeroom.sh "-f" "-s" "annotation" "-t" "braker" "-v" "3.0.8" "-w" "https://github.com/Gaius-Augustus/BRAKER" "-l" "Artistic 1.0" "-L" "https://raw.githubusercontent.com/Gaius-Augustus/BRAKER/master/LICENSE.TXT" "-d" "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ETP and AUGUSTUS in novel eukaryotic genomes"
    ./makeroom_braker_3.0.8.sh

    source /sw/bioinfo/braker/SOURCEME_braker_3.0.8

    cd $SRCDIR

    wget https://github.com/Gaius-Augustus/BRAKER/archive/refs/tags/v3.0.8.tar.gz
    tar xf v3.0.8.tar.gz 
    rmdir $PREFIX && mv BRAKER-3.0.8 $PREFIX
    cd $PREFIX
    cd scripts/

We no longer need to modify the first line to use env perl since these scripts
now include that, but double-check anyway.

    head -n 1 *.pl

Execute permissions on `compare_intervals_exact.pl`.

    chmod +x compare_intervals_exact.pl

Modify line 2342 of `braker.pl` to more generally check for java. I've
submitted a pull request for this.

    vi +2342 braker.pl

Change this line to:

    $cmdString = "java -version 2>&1 | grep 'version' | awk -F['\"''.'] -v OFS=. ".'\'{print $2,$3}\'';

Set up a virtualenv for biopython. Make sure python3 comes from the virtualenv.
Make the python scripts point to this python3.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    ml -python
    which python3
    pip3 install biopython
    cd $PREFIX/scripts
    sed -i -e '1i#!'"$(which python3)" *.py
    deactivate

Fetch example data.

    cd $PREFIX/example
    wget http://bioinf.uni-greifswald.de/augustus/datasets/RNAseq.bam

    module load perl/5.32.1
    module load perl_modules/5.32.1

Prerequisites. Loading GeneMark-ETP/1.02-20231213-dd8b37b loads several of
these. We also load them here. Lines for the mf file:

    depends-on GeneMark-ETP/1.02-20231213-dd8b37b
    depends-on augustus/3.5.0-20231223-33fc04d
    depends-on bamtools/2.5.2
    depends-on samtools/1.19
    depends-on spaln/3.0.3
    depends-on blast/2.14.1+
    depends-on cdbfasta/1.00
    depends-on GUSHR/1.0.0
    depends-on MakeHub/1.0.8-20240217-31cc299
    depends-on compleasm/0.2.6
    depends-on ucsc-utilities/v421
    depends-on seqstats/20170404-e6f482f
    depends-on ProtHint/2.6.0-20231027-103304c
    depends-on TSEBRA/1.1.2.4

We need compleasm/0.2.6, built from my fork from the original, since it
implements the COMPLEASM_LIBRARY_PATH variable, which we use to point to our
downloaded lineage sets.

These are loaded by GeneMark-ETP. I will load them separately for braker 3.

    depends-on diamond/2.1.9
    depends-on sratools/3.0.7
    depends-on HISAT2/2.2.1
    depends-on BEDTools/2.31.1
    depends-on StringTie/2.2.1
    depends-on gffread/0.12.7

Additional dependencies from the Docker file include ucsc-utilities adn seqstats.

A FFmpeg module is required "for matplotlib anim"

    FFmpeg/5.1.2


These seem to no longer be needed.

    exonerate/2.4.0
    GenomeThreader/1.7.4


Add `$modroot/scripts` to `PATH`.

We also need to define `PYTHON3_PATH` and set that to point to the venv bin
directory, since at line 2278 in the braker.pl script, it checks for biopython
by calling python3 directly. $!@#$(*@$%(&@#(*^Q)$%&*!(@$&%@($%^*)@#$%(

    set  venv_bin  $modroot/venv/bin

    setenv PYTHON3_PATH $venv_bin

No testing for this version yet.

Wrap up.

    cd $TOOLDIR
    ./braker-3.0.8_post-install.sh


Testing
-------

    ml bioinfo-tools braker/3.0.8
    cd $BRAKER_ROOT/example
    cd tests

Running `source $AUGUSTUS_CONFIG_COPY` is always required to set up an
annotation environment, and that script was modified to print its export line
for `AUGUSTUS_CONFIG_PATH` since that always need to be set after the config
directory is created.

    source $AUGUSTUS_CONFIG_COPY

After doing this, the setup line is

    export AUGUSTUS_CONFIG_PATH=/sw/bioinfo/braker/3.0.8/rackham/example/tests/augustus_config

Running tests:

    cd /sw/bioinfo/braker/2.1.5/src/BRAKER-2.1.5/example

Download missing RNA-Seq test data:

    wget http://bioinf.uni-greifswald.de/bioinf/braker/RNAseq.bam

Run the tests.

    cd tests
    bash test1.sh

I modified these to tee the log file. These also revealed that loading ProtHint and TSEBRA is expected.
