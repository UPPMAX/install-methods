snakemake/4.5.0
========================

<http://snakemake.readthedocs.io/en/latest/getting_started/installation.html>

LOG
---

I installed it using python 3.6.0 and pip with system gcc and prefix 

    TOOL=snakemake
    VERSION=4.5.0
    /home/jonass/uppmax/makeroom.sh
    ./makeroom_snakemake_4.5.0.sh
    module load bioinfo-tools python/3.6.0
    LOC=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    export PYTHONPATH=$LOC/lib/python3.6/site-packages
    pip3 install --install-option="--prefix=$LOC" $TOOL

