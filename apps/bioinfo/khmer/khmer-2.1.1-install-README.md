khmer/2.1.1
===========

khmer k-mer counting library
<https://pypi.python.org/pypi/khmer>

LOG
---

Installed via Python's pip using the PREFIX option. As always, it is critically
important that you do not have write permission to the main Python
installation, to avoid possible library corruption.

    VERSION=2.1.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOL=khmer
    PFX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    module load python/2.7.11
    module load gcc/6.3.0
    mkdir -p $PFX
    PYTHONUSERBASE=$PFX pip install --user khmer==$VERSION

Above is Doug's preferred method; Wes prefers

    VERS=2.1.1
    APPL=khmer
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load python/2.7.11
    module load gcc/6.3.0
    mkdir -p $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    pip install --install-option="--prefix=$INST" $APPL

