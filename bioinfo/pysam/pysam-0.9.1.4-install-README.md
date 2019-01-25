# pysam-0.9.1.4-install-readme.md

pysam
=====

Python module for reading and manipulating samfiles
<https://github.com/pysam-developers/pysam>

installation
------------

Installed via Python's pip. If there's reason to suspect that
PYTHONPATH isn't empty, could prepend to the old value.
Can change the object of the pip command to "$TOOL==$VERS"
(double equals) to install a version other than the latest.

    TOOL=pysam
    VERS=0.9.1.4
    module load python/2.7.6

    # The remainder should be the same for most python-based modules
    APPS=/sw/apps/bioinfo
    INST=$APPS/$TOOL/$VERS/$CLUSTER
    echo $INST # sanity check
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $TOOL

---
wesleys  
2016-07-24
