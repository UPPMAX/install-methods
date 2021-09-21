BUSCO/5.0.0
========================

<https://busco.ezlab.org/>

Used under license:
MIT
<>

Structure creating script (makeroom_BUSCO_5.0.0.sh) moved to /sw/bioinfo/BUSCO/makeroom_5.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "BUSCO" -v "5.0.0" -w "https://busco.ezlab.org/" -l "MIT" -d "Based on evolutionarily-informed expectations of gene content of near-universal single-copy orthologs\, BUSCO metric is complementary to technical metrics like N50." -f""
    ./makeroom_BUSCO_5.0.0.sh
    BUSCO/4.1.4

    source /sw/bioinfo/BUSCO/SOURCEME_BUSCO_5.0.0
    cd $SRCDIR
    git clone --depth 1 --branch 4.1.4 https://gitlab.com/ezlab/busco.git 
    cd busco

    module load bioinfo-tools
    module load blast/2.11.0+
    module load augustus/3.4.0
    module load prodigal/2.6.3
    module load metaeuk/4-a0f584d
    module load hmmer/3.2.1
    module load sepp/4.3.10
    module load biopython/1.78
    python3 -m pip install  --ignore-installed --prefix=$PREFIX pandas==1.2.3 jupyter-client==6.1.5 nbformat==5.0.2

    cp $SRCDIR/busco/config/config.ini $PREFIX/config.ini
Modify the config.ini with the paths further down in this file.

    export PYTHONPATH=${PREFIX}/lib/python3.8/site-packages/:${PYTHONPATH}
    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v5_lineage_sets/lineages
    python3 setup.py install --prefix=$PREFIX


    mv $PREFIX/bin/busco $PREFIX/bin/run_BUSCO.py


# Local destination path for downloaded lineage datasets
download_path = /sw/bioinfo/BUSCO/v5_lineage_sets/
# Run offline
offline=True
# Ortho DB Datasets version
datasets_version = odb10

[tblastn]
path = /sw/bioinfo/blast/2.11.0+/rackham/bin/
command = tblastn

[makeblastdb]
path = /sw/bioinfo/blast/2.11.0+/rackham/bin/
command = makeblastdb

[metaeuk]
path = /sw/bioinfo/metaeuk/4-a0f584d/rackham/bin/
command = metaeuk

[augustus]
path = /sw/bioinfo/augustus/3.4.0/rackham/bin/
command = augustus

[etraining]
path = /sw/bioinfo/augustus/3.4.0/rackham/bin/
command = etraining

[gff2gbSmallDNA.pl]
path = /sw/bioinfo/augustus/3.4.0/rackham/scripts/
command = gff2gbSmallDNA.pl

[new_species.pl]
path = /sw/bioinfo/augustus/3.4.0/rackham/scripts/
command = new_species.pl

[optimize_augustus.pl]
path = /sw/bioinfo/augustus/3.4.0/rackham/scripts/
command = optimize_augustus.pl

[hmmsearch]
path = /sw/bioinfo/hmmer/3.2.1/rackham/bin/
command = hmmsearch

[sepp]
path = /sw/bioinfo/sepp/4.3.10/rackham/bin/
command = run_sepp.py

[prodigal]
path = /sw/bioinfo/prodigal/2.6.3/rackham/bin/
command = prodigal



#Download v5_lineage_sets. The script $TOOLDIR/v5_lineage_sets/BUSCO-update-v5-lineage-sets.sh updates the database.
    mkdir $TOOLDIR/v5_lineage_sets
    cd $TOOLDIR/v5_lineage_sets
    wget -r -np --cut-dirs=2 -nH -R index.html https://busco-data.ezlab.org/v5/data/

    cd $TOOLDIR/v5_lineage_sets/information && find -iname "*.tar.gz" -exec tar xfvz {} \;
    cd $TOOLDIR/v5_lineage_sets/placement_files && find -iname "*.tar.gz" -exec tar xfvz {} \;
    cd $TOOLDIR/v5_lineage_sets/lineages && find -iname "*.tar.gz" -exec tar xfvz {} \;
    cd $TOOLDIR/v5_lineage_sets/lineages && find -iname "refseq*.gz" -exec gzip -dv {} \;

run $TOOLDIR/v5_lineage_sets/BUSCO-update-v5-lineage-sets.sh





========================

<https://busco.ezlab.org/>

Used under license:

<>

Structure creating script (makeroom_BUSCO_4.1.4.sh) moved to /sw/bioinfo/BUSCO/makeroom_4.1.4.sh

LOG
---

    TOOL=BUSCO
    VERSION=4.1.4
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/BUSCO/4.1.4/src
    /home/douglas/bin/makeroom.sh -f" -t "BUSCO" -v "4.1.4" -w "https://busco.ezlab.org/" -c "bioinfo" -s "misc" -d "assessing genome assembly and annotation completeness""
    ./makeroom_BUSCO_4.1.4.sh
    source /sw/bioinfo/BUSCO/SOURCEME_BUSCO_4.1.4

# The download was already done when I started but should look like this
    cd $SRCDIR
    git clone --depth 1 --branch 4.1.4 https://gitlab.com/ezlab/busco.git 
    cd busco

    module load bioinfo-tools
    module load augustus/3.4.0
    module load blast/2.10.1+
    module load prodigal/2.6.3
    module load metaeuk/4-a0f584d
    module load hmmer/3.2.1
    module load sepp/4.3.10
    module load biopython/1.76-py3

    python3 scripts/busco_configurator.py config/config.ini /config/config.ini
    cp $SRCDIR/busco/config/config.ini $PREFIX
    export PYTHONPATH=${PREFIX}/lib/python3.7/site-packages/:${PYTHONPATH}
    export BUSCO_CONFIG_FILE=${PREFIX}/config.ini
    python3 setup.py install --prefix=$PREFIX

    cp -av $SRCDIR/busco/scripts/generate_plot.py $PREFIX/bin
    #cp -av /sw/bioinfo/augustus/3.4.0/rackham/augustus_config_copy $PREFIX
    mv $PREFIX/bin/busco $PREFIX/bin/run_BUSCO.py
Modify the header of $PREFIX/bin/run_BUSCO.py to #!/usr/bin/env python3
    



#Download v4_lineage_sets. The script $TOOLDIR/v4_lineage_sets/BUSCO-update-v4-lineage-sets.sh updates the database.
    mkdir $TOOLDIR/v4_lineage_sets
    cd $TOOLDIR/v4_lineage_sets
    wget -r -np --cut-dirs=2 -nH -R index.html https://busco-data.ezlab.org/v4/data/
    cd $TOOLDIR/v4_lineage_sets/information && find -iname "*.tar.gz" -exec tar xfvz {} \;
    cd $TOOLDIR/v4_lineage_sets/placement_files && find -iname "*.tar.gz" -exec tar xfvz {} \;
    cd $TOOLDIR/v4_lineage_sets/lineages && find -iname "*.tar.gz" -exec tar xfvz {} \;


    export BUSCO_LINEAGE_SETS=${TOOLDIR}/v4_lineage_sets/lineages







BUSCO/3.0.2b
============

Check gene content of assemblies.

<http://busco.ezlab.org/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.0.2b
    cd /sw/apps/bioinfo/BUSCO/
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src_${CLUSTER}
    cd src_${CLUSTER}
    module load git/2.16.1
    [[ -d busco ]] || git clone https://gitlab.com/ezlab/busco.git
    cd busco
    module load python/3.4.3
    PYTHONUSERBASE=$PFX pip3 install --user .

This installs the python packages busco and pipebricks.  It does not install
the other scripts, data etc. for running BUSCO itself.  These commands do.


    cp -av sample_data $PFX/
    cp -av scripts $PFX/bin
    cp ../milou/config.ini .
    cp -av ../milou/augustus_config_copy .
    cp -av ../milou/BUSCO_v3_userguide.pdf .

We must make sure `BUSCO_CONFIG_FILE` is set, and that config.ini contains
settings for the cluster we are on.  The switch to the config file means that
we include paths to tools, in addition to loading the same tools as modules.
Redundant, but checking the python packages for handling the config indicates
that setting these paths is typically required. 

We download the tagged release from gitlab.

Get scripts ready for running on UPPMAX. Hash-bang line should be
`#!/usr/bin/env python3`, we load `python/3.4.3`.

    vi *.py

The name of the run script is changed to `run_BUSCO.py`.

In the mf file, as for 1.22 we load blast+, hmmer and augustus.  Here the versions
are `blast/2.6.0+`, `hmmer/3.1b2`, and `augustus/3.2.3`.  I've simplified the printed
message on module load to point toward `module help BUSCO/3.0.2b`.  There are a **LOT**
more lineage sets and we list them all in the help.

Also copy over the `augustus_config_copy` script from `augustus/3.2.3` to be
**sourced**, which creates a local copy of the augustus config directory for
the user.  Busco can't seem to work around this being read-only.  Add
instructions for its use to module load and module help.  See these and the
script for more.

Lineage sets
------------

BUSCO v3 uses the v2 lineage sets, so `v3_lineage_sets` is a symlink to the v2 one.

