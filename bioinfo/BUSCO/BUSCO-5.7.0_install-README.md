BUSCO/5.7.0
===========

<https://busco.ezlab.org/>

Used under license:
MIT
<https://busco.ezlab.org/#license>

Structure creating script (makeroom_BUSCO_5.7.0.sh) moved to /sw/bioinfo/BUSCO/makeroom_5.7.0.sh


BUSCO lineage sets
------------------

Install within a virtualenv.

These are moved to `/sw/data/BUSCO_data`.  See there for more details.

LOG
---

    makeroom.sh -f -t BUSCO -v 5.7.0 -w https://busco.ezlab.org/ -l MIT -L https://busco.ezlab.org/#license -d "Based on evolutionarily-informed expectations of gene content of near-universal single-copy orthologs, BUSCO metric is complementary to technical metrics like N50."
    ./makeroom_BUSCO_5.7.0.sh 
    source /sw/bioinfo/BUSCO/SOURCEME_BUSCO_5.7.0
    cd $SRCDIR

    vi /sw/data/BUSCO_data/BUSCO_data-latest_install-README.md 
    wget https://gitlab.com/ezlab/busco/-/archive/5.7.0/busco-5.7.0.tar.bz2
    tar xf busco-5.7.0.tar.bz2 

    cd $PREFIX
    module load python/3.11.4
    virtualenv venv
    source venv/bin/activate

    which python3

    python3 -m pip install --ignore-installed attrs nbclient pandas jupyter-client nbformat biopython

    cd $SRCDIR
    cd busco-5.7.0/
    pip install .

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/busco .

    ./busco 
    deactivate
    ./busco 

Auxiliary script.

    cd $PREFIX/bin
    cp -av $SRCDIR/busco-5.7.0/scripts/generate_plot.py .

To load with this:

    module load blast/2.15.0+
    module load augustus/3.5.0-20231223-33fc04d
    module load prodigal/2.6.3
    module load metaeuk/6-a5d39d9
    module load hmmer/3.4
    module load sepp/4.5.1

Modify the config.ini. If the path is commented out, it will look in the $PATH variable instead.

    cp $SRCDIR/busco/config/config.ini $PREFIX
    sed -i 's/^\(path\)/\;\1/g' $PREFIX/config.ini
    sed -i 's/\;\(offline\)/\1/' $PREFIX/config.ini
    sed -i 's/\;\(datasets_version\)/\1/' $PREFIX/config.ini

    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v5_lineage_sets/lineages


Wrap up.

    cd $TOOLDIR
    ./BUSCO-5.5.0_post-install.sh

Load and test.

    ml bioinfo-tools BUSCO/5.5.0
    cd $SRCDIR
    mkdir t
    cd t

    busco  \
        -i $SRCDIR/busco-5.5.0/test_data/eukaryota/genome.fna \
        -o eukaryota.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f

    source $AUGUSTUS_CONFIG_COPY
    busco  \
        -i $SRCDIR/busco-5.5.0/test_data/eukaryota/genome.fna \
        -o eukaryota.augustus.test \
        -l $BUSCO_LINEAGE_SETS/eukaryota_odb10/ \
        -m genome -c 4 -f \
        --augustus

