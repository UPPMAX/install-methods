# deepTools-2.2.3-install-README.md

deepTools
=========

Useful tools for exploring deep sequencing data
<https://github.com/fidelram/deepTools>

installation
------------

Installed via Python's pip. A newer release was availble when this was 
installed so the version was specified in the pip command ("==$VERS").
The pysam requirement was satisfied through pip to match the installation
on other clusters (not checked carefully).

    TOOL=deepTools
    VERS=2.2.3
    module load python/2.7.6
    module load gcc/4.9.2
    module load libcurl/7.45.0

    # The remainder should be the same for most python-based modules
    APPS=/sw/apps/bioinfo
    INST=$APPS/$TOOL/$VERS/$CLUSTER
    echo $INST # sanity check
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $TOOL==$VERS

---
wesleys  
2016-07-24
