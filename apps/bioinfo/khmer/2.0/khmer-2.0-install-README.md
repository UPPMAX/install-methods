# khmer-2.0-install-README.md

khmer
=====

khmer k-mer counting library
<https://pypi.python.org/pypi/khmer>

installation
------------

Installed via Python's pip using the PREFIX option. As always,
it is critically important that you do not have write permission
to the main Python installation (to avoid possible lib corruption).  

Compilation with gcc/system failed so switched to latest gcc.

    VERS=2.0
    APPL=khmer
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load python/2.7.6
    module load gcc/6.3.0
    mkdir $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $APPL

If $VERS isn't the current release, append "==$VERS" to the
pip command (without spaces).

---
wesleys  
2017-02-08
