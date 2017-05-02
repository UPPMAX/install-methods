# pysam-0.10.0-install-README.md

pysam
=====

pysam: reading, manipulating and writing genomic data sets
<https://pypi.python.org/pypi/pysam>

installation
------------

Installed via Python's pip using the PREFIX option. As always,
it is critically important that you do not have write permission
to the main Python installation (to avoid possible lib corruption).  

Compilation with gcc/system failed so switched to latest gcc.

    VERS=0.10.0
    APPL=pysam
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load python/2.7.6
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $APPL==$VERS

---
wesleys  
2017-02-27
