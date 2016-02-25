# MultiQC-0.4-install-README.md

MultiQC
=======

Create aggregate bioinformatics reports  
<https://pypi.python.org/pypi/multiqc/>

installation
------------

Installed via Python's pip with a specified prefix. Note that PYTHONPATH
must be defined before pip installation. Could install via PYTHONUSERBASE
(or other trick) but using this method for consistancy.

    VERS=0.4
    INST=/sw/apps/bioinfo/MultiQC/$VERS/$CLUSTER
    module load python/2.7.6
    mkdir $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" multiqc

---
wesleys  
2015-02-17
