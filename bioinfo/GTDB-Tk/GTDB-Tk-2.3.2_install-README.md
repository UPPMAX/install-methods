GTDB-Tk/2.3.2
=============

<https://github.com/Ecogenomics/GTDBTk>

Used under license:
GPLv3


Structure creating script (makeroom_GTDB-Tk_2.3.2.sh) moved to /sw/bioinfo/GTDB-Tk/makeroom_2.3.2.sh

As a result of this installation, also installed as upgrades, the data module
GTDB/R214.1, and the software modules FastANI/1.34 and FastTree/2.1.11

Different from previous installations, installed this within a venv and added
symlinks to executables from `$PREFIX/bin/`. This way, I don't need to load a
python module or update `PYTHONPATH`.

LOG
---

    makeroom.sh -f -t "GTDB-Tk" -v "2.3.2" -w "https://github.com/Ecogenomics/GTDBTk" -l "GPLv3" -d "A software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes based on the Genome Database Taxonomy (GTDB). It is designed to work with recent advances that allow hundreds or thousands of metagenome-assembled genomes (MAGs) to be obtained directly from environmental samples. It can also be applied to isolate and single-cell genomes."
    ./makeroom_GTDB-Tk_2.3.2.sh 
    source /sw/bioinfo/GTDB-Tk/SOURCEME_GTDB-Tk_2.3.2 && cd $SRCDIR

Now create a virtualenv within $PREFIX.

    cd $PREFIX
    virtualenv venv
    $PREFIX/venv/bin/pip3 install gtdbtk
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/{gtdbtk,sumlabels.py,sumtrees.py,dendropy-format} .

In the mf file, load the data module

    GTDB/R214.1

and the software modules

    prodigal/2.6.3
    hmmer/3.3.2
    pplacer/1.1.alpha19
    FastTree/2.1.11
    FastANI/1.34 mash/2.3
    mash/2.3


### Test

    module load bioinfo-tools GTDB-Tk/2.3.2
    gtdbtk check_install

Takes a little while, but should be a good demo.
