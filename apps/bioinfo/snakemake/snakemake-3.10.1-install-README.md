# snakemake-3.10.1-install-README.md

snakemake
=========

snakemake workflow management system
<https://pypi.python.org/pypi/snakemake>

installation
------------

Installed via Python's pip3 using the PREFIX option. Attempts to install
with python/3.4.3 failed, possibly due it's rpath,  which might
require a different module installation method.

As always, it is critically important that you do not have write
permission to the main Python installation (to avoid possible lib 
corruption).  

Used system gcc.

    VERS=3.10.1
    APPL=snakemake
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load python/3.6.0
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python3.6/site-packages
    pip3 install --install-option="--prefix=$INST" $APPL

---
wesleys  
2017-02-28
