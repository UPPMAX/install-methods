BUSCO/5.7.1
===========

<https://busco.ezlab.org/>

Used under license:
MIT
<https://busco.ezlab.org/#license>

Structure creating script (makeroom_BUSCO_5.7.1.sh) moved to /sw/bioinfo/BUSCO/makeroom_5.7.1.sh


BUSCO lineage sets
------------------

Install within a virtualenv.

These are moved to `/sw/data/BUSCO_data`.  See there for more details.

LOG
---

    makeroom.sh -f -t BUSCO -v 5.7.1 -w https://busco.ezlab.org/ -l MIT -L https://busco.ezlab.org/#license -d "Based on evolutionarily-informed expectations of gene content of near-universal single-copy orthologs, BUSCO metric is complementary to technical metrics like N50."
    ./makeroom_BUSCO_5.7.1.sh 
    source /sw/bioinfo/BUSCO/SOURCEME_BUSCO_5.7.1
    cd $SRCDIR

    vi /sw/data/BUSCO_data/BUSCO_data-latest_install-README.md 
    wget https://gitlab.com/ezlab/busco/-/archive/5.7.1/busco-5.7.1.tar.bz2
    tar xf busco-5.7.1.tar.bz2 

    cd $PREFIX
    module load python/3.11.4
    virtualenv venv
    source venv/bin/activate
    ml -python

    which python3

    python3 -m pip install --ignore-installed attrs nbclient pandas jupyter-client nbformat biopython requests

    cd $SRCDIR
    cd busco-5.7.1/
    pip install .

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/busco .

    ./busco 

Auxiliary script.

    cd $PREFIX/bin
    sed 's,^#!/usr/bin/env python3,#!'"$(which python3)"',' < $SRCDIR/busco-5.7.1/scripts/generate_plot.py > generate_plot.py
    chmod +x generate_plot.py

Modify an installed script to fix a bug revealed during testing below, see <https://gitlab.com/ezlab/busco/-/issues/751>.  The exception observed is `TypeError: Object of type float32 is not JSON serializable`.

    cd $PREFIX
    vi +626 ./venv/lib/python3.11/site-packages/busco/BuscoRunner.py

Just after `def write_json_summary(self):` insert these lines into the body of that function with the appropriate indent.

    if type(self.summary['results']['avg_identity']) != type(None):
        self.summary['results']['avg_identity'] = float(self.summary['results']['avg_identity'])

Deactivate environment to test.  Do this after installing the auxiliary script!

    deactivate

To load with this:

    module load blast/2.15.0+
    module load augustus/3.5.0-20231223-33fc04d
    module load prodigal/2.6.3
    module load metaeuk/6-a5d39d9
    module load hmmer/3.4
    module load sepp/4.5.2
    module load miniprot/0.13
    module load bbmap/39.08

Modify the config.ini. If the path is commented out, it will look in the $PATH variable instead.

    cp $SRCDIR/busco-5.7.1/config/config.ini $PREFIX
    sed -i 's/^\(path\)/\;\1/g' $PREFIX/config.ini
    sed -i 's/\;\(offline\)/\1/' $PREFIX/config.ini
    sed -i 's/\;\(datasets_version\)/\1/' $PREFIX/config.ini

    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v5_lineage_sets/lineages


Wrap up.

    cd $TOOLDIR
    ./BUSCO-5.7.1_post-install.sh

Load and test.

    ml bioinfo-tools BUSCO/5.7.1
    cd $SRCDIR
    mkdir t
    cd t

    busco  \
        -i $SRCDIR/busco-5.7.1/test_data/eukaryota/genome.fna \
        -o eukaryota.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f

TESTING REVEALED A PROBLEM.  Solved by <https://gitlab.com/ezlab/busco/-/issues/751>

    source $AUGUSTUS_CONFIG_COPY
    busco  \
        -i $SRCDIR/busco-5.7.1/test_data/eukaryota/genome.fna \
        -o eukaryota.augustus.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f \
        --augustus

