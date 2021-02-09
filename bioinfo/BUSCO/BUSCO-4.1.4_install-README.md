BUSCO/4.1.4
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

