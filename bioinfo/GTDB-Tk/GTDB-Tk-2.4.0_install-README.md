GTDB-Tk/2.4.0
=============

<https://github.com/Ecogenomics/GTDBTk>

Used under license:
GPLv3


Structure creating script (makeroom_GTDB-Tk_2.4.0.sh) moved to /sw/bioinfo/GTDB-Tk/makeroom_2.4.0.sh

As a result of this installation, also installed as upgrades, the data module
GTDB/R214.1, and the software modules FastANI/1.34 and FastTree/2.1.11

Different from previous installations, installed this within a venv and added
symlinks to executables from `$PREFIX/bin/`. This way, I don't need to load a
python module or update `PYTHONPATH`.

LOG
---

    makeroom.sh -f -t "GTDB-Tk" -v "2.4.0" -w "https://github.com/Ecogenomics/GTDBTk" -l "GPLv3" -d "A software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes based on the Genome Database Taxonomy (GTDB). It is designed to work with recent advances that allow hundreds or thousands of metagenome-assembled genomes (MAGs) to be obtained directly from environmental samples. It can also be applied to isolate and single-cell genomes."
    ./makeroom_GTDB-Tk_2.4.0.sh 
    source /sw/bioinfo/GTDB-Tk/SOURCEME_GTDB-Tk_2.4.0
    cd $SRCDIR

Now create a virtualenv within $PREFIX.

    cd $PREFIX
    virtualenv venv
    $PREFIX/venv/bin/pip3 install gtdbtk
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/{gtdbtk,sumlabels.py,sumtrees.py,dendropy-format} .

In the mf file, load the new data module:

    GTDB/R220

and the software modules

    prodigal/2.6.3
    hmmer/3.4
    pplacer/1.1.alpha19
    FastTree/2.1.11
    skani/0.2.1
    mash/2.3-20210519-41ddc61


### Test

    module load bioinfo-tools
    module load GTDB-Tk/2.4.0
    gtdbtk check_install

Takes a little while -- note the skani data step required nearly 2 h. Its output confirmed everything is OK:

    rackham5: /sw/bioinfo/GTDB-Tk $ gtdbtk check_install
    [2024-05-07 14:20:56] INFO: GTDB-Tk v2.4.0
    [2024-05-07 14:20:56] INFO: gtdbtk check_install
    [2024-05-07 14:20:56] INFO: Using GTDB-Tk reference data version r220: /sw/data/GTDB/R220/rackham/release220
    [2024-05-07 14:20:56] INFO: Running install verification
    [2024-05-07 14:20:56] INFO: Checking that all third-party software are on the system path:
    [2024-05-07 14:20:56] INFO:          |-- FastTree         OK
    [2024-05-07 14:20:56] INFO:          |-- FastTreeMP       OK
    [2024-05-07 14:20:56] INFO:          |-- guppy            OK
    [2024-05-07 14:20:56] INFO:          |-- hmmalign         OK
    [2024-05-07 14:20:56] INFO:          |-- hmmsearch        OK
    [2024-05-07 14:20:56] INFO:          |-- mash             OK
    [2024-05-07 14:20:56] INFO:          |-- pplacer          OK
    [2024-05-07 14:20:56] INFO:          |-- prodigal         OK
    [2024-05-07 14:20:56] INFO:          |-- skani            OK
    [2024-05-07 14:20:56] INFO: Checking integrity of reference package: /sw/data/GTDB/R220/rackham/release220
    [2024-05-07 14:21:00] INFO:          |-- pplacer          OK
    [2024-05-07 14:21:00] INFO:          |-- masks            OK
    [2024-05-07 14:21:09] INFO:          |-- markers          OK
    [2024-05-07 14:21:09] INFO:          |-- radii            OK
    [2024-05-07 14:21:19] INFO:          |-- msa              OK
    [2024-05-07 14:21:19] INFO:          |-- metadata         OK
    [2024-05-07 14:21:19] INFO:          |-- taxonomy         OK
    [2024-05-07 16:10:09] INFO:          |-- skani            OK
    [2024-05-07 16:10:09] INFO:          |-- mrca_red         OK
    [2024-05-07 16:10:09] INFO: Done.

